require 'rails_helper'

feature 'User || Guest can view' do
  given(:questions) { create_list :question, 3 }
  given!(:question) { questions.first }

  before { visit root_path }

  scenario "User can view list questions in Index" do
    questions.each do |question|
      expect(page).to have_link question.title, href: question_path(question)
    end
  end
end