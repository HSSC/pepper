class Question < ActiveRecord::Base
  include QuestionImageGenerator

  serialize :dimensions

  validates :dimensions, presence: true

  belongs_to :question_set
  has_one :survey, :through => :question_set
end
