class Question < ActiveRecord::Base
	has_many :answers
	
	validates :title, :body, presence: true

	validates :title, length:  { in: 15..150 }
	validates :body, length: { minimum: 30 }
end
