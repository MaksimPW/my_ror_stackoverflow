require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	let(:question) { create(:question) }

	describe 'GET #index' do
		let(:questions) {create_list(:question, 2)}
		
		before { get :index }

		it 'pupulates an array of all questions' do
			expect(assigns(:questions)).to match_array(questions)
		end

		it 'render index view' do
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
		before { get :show, id: question }

		it 'assigns the requested question to @question' do
			expect(assigns(:question)).to eq question
		end

		it 'renders show view' do
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		before { get :new }

		it 'assigns a new Question to @question' do
			expect(assigns(:question)).to be_a_new(Question)
		end

		it 'renders new view' do
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before { get :edit, id: question }

		it 'ssigns the requested question to @question' do
			expect(assigns(:question)).to eq question
		end

		it 'renders new view' do
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves the new question in the database' do
				expect { post :create, question: attributes_for(:question) }.to change(Question, :count).by(1)
			end

			it 'redirects to show view' do
				post :create, question: attributes_for(:question)
				expect(response).to redirect_to question_path(assigns(:question))
			end
		end

		context 'with invalid attributes' do
			it 'saves the new question in the database' do
				expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
			end

			it 're-renders new view' do
				post :create, question: attributes_for(:invalid_question)
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH #update' do 
		context 'valid attributes' do
			it 'assigns the requested question to @question' do
				patch :update, id: question, question: attributes_for(:question)
				expect(assigns(:question)).to eq question
			end

			it 'changes question attributes' do
				patch :update, id: question, question: { title: 'New good title for Question', body: 'New good body for Question, New good body for Question'}
				question.reload
				expect(question.title).to eq 'New good title for Question'
				expect(question.body).to eq 'New good body for Question, New good body for Question'
			end

			it 'redirects to the updated question' do
				patch :update, id: question, question: attributes_for(:question)
				expect(response).to redirect_to question
			end
		end

		context 'invalid attributes' do
		end
	end
end
