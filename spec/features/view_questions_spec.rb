require 'rails_helper'

feature 'User || Guest can view' do
  given(:questions) { create_list :question, 3 }
  given!(:question) { questions.first }
  given(:answers) { create_list(:answer, 3, question: question) }

  before { visit root_path }

  scenario "User can view list questions in Index" do
    questions.each do |question|
      expect(page).to have_link question.title, href: question_path(question)
    end
  end

  scenario "User can view list answers in question show" do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body

    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end
end