class QuestionSet < ActiveRecord::Base
  belongs_to :survey
  has_many :questions

  validates :participant_identifier, presence: true
  validates :survey, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true
end
