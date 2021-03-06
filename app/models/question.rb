class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	validates :title, presence: true, length: { in: 15..150  }
	validates :body, presence: true, length: { minimum: 30 }
end
