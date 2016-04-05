require 'rails_helper'

feature 'User sign in', %q{
  In order to able to ask question
  As an User
  I want to be able to sign in
} do

  scenario 'Registered user try to sign in' do
    User.create!(email: 'user@test.com', password: '1234567890')

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Sign in'

    expect(page).to have_content 'Signed in sucessfully'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do
    User.create!(email: 'user@test.com', password: '1234567890')

    visit new_user_session_path
    fill_in 'Email', with: 'invalid@test.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Sign in'

    expect(page).to have_content 'Invalid email or password'
    expect(current_path).to eq new_user_session_path
  end

end