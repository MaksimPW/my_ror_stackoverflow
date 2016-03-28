class AnswersController < ApplicationController
	before_action :load_question, only: [:new]

	def new
		@answer = @question.answers.new
	end

	private

	def load_question
		@question = Question.find(params[:question_id])
	end

	def answer_params
		params.require(:question).permit(:body)
	end

end
