require 'rails_helper'

feature 'User registered in' do
  given(:old_user) { create(:user) }

  scenario 'Guest try to registered' do
    visit new_user_session_path
    click_link 'Sign up'

    expect(page).to have_current_path new_user_registration_path

    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    click_on 'Sign up'

    expect(page).to have_content "You have signed up successfully"
    expect(page).to have_current_path root_path
  end

  scenario 'Registered user try to registered' do

    sign_in(old_user)
    click_on "Logout"
    visit new_user_session_path
    click_link 'Sign up'

    expect(page).to have_current_path new_user_registration_path

    fill_in 'Email', with: old_user.email
    fill_in 'Password', with: old_user.password
    fill_in 'Password confirmation', with: old_user.password
    click_on 'Sign up'

    expect(page).to have_content "Email has already been taken"
    expect(page).to_not have_current_path root_path
  end

end