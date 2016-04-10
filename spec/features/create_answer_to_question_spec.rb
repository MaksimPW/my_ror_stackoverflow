require 'rails_helper'

feature 'User can create answer' do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'Auth user try to create good answer' do
    sign_in(user)

    visit question_path(question)
    fill_in 'Body', with: 'New body answer. Minimum 30 chars. New body answer. Minimum 30 chars'
    click_on 'Create answer'

    expect(page).to have_content 'New body answer. Minimum 30 chars. New body answer. Minimum 30 chars'
  end

  scenario 'Auth user try to create invalid answer' do
    sign_in(user)

    visit question_path(question)
    fill_in 'Body', with: ''
    click_on 'Create answer'

    expect(page).not_to have_content 'New body answer. Minimum 30 chars. New body answer. Minimum 30 chars'
  end

  scenario 'UnAuth user try to create answer' do
    visit question_path(question)

    expect(page).not_to have_content 'Create answer'

  end

end