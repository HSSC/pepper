class Question < ActiveRecord::Base
  include QuestionImageGenerator

  belongs_to :question_set
  has_many :question_dimensions

  validates :question_set, presence: true
end
