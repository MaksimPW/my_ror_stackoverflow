require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
	let(:question) { create(:question) }
	let(:answer) { create(:answer, question: question) }

	describe 'GET #new' do
		before { get :new, question_id: question.id }

		it 'assigns a new Answer to @answer' do
			expect(assigns(:answer)).to be_a_new(Answer)
		end

		it 'renders new view' do
			expect(response).to render_template :new
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect { post :create, question_id: question.id, answer: attributes_for(:answer) }.to change(question.answers, :count).by(1)
      end

			it 'redirects to show view' do
				post :create, question_id: question, answer: attributes_for(:answer)
				expect(response).to redirect_to question_path(assigns(:question))
			end
		end

		context 'with invalid attributes' do
			it 'saves the new question in the database' do
				expect { post :create, question_id: question.id, answer: attributes_for(:invalid_answer) }.to_not change(Answer, :count)
			end

			it 're-renders new view' do
				post :create, question_id: question, answer: attributes_for(:invalid_answer)
			end
		end
	end
end
