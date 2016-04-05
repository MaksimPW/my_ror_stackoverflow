require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  I want to be able to ask questions
} do

  scenario 'Auth user creates question' do
    User.create!(email: 'user@test.com', password: '1234567890')

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'New Test question. Minimum 15 chars'
    fill_in 'Body', with: 'New body question. Minimum 30 chars. New body question. Minimum 30 chars'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created'
  end

  scenario 'Auth user creates question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

end