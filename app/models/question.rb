class Question < ActiveRecord::Base
  include QuestionImageGenerator

  belongs_to :question_set
  has_many :question_dimensions, dependent: :destroy

  accepts_nested_attributes_for :question_dimensions, allow_destroy: true
end
