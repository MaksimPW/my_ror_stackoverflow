require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  I want to be able to ask questions
} do

  given(:user) { create(:user) }

  scenario 'Auth user creates question' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'New Test question. Minimum 15 chars'
    fill_in 'Body', with: 'New body question. Minimum 30 chars. New body question. Minimum 30 chars'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created'
  end

  scenario 'UnAuth user creates question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

end