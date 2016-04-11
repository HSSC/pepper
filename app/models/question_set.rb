class QuestionSet < ActiveRecord::Base
  serialize :descriptors

  validates :participant_identifier, presence: true

  has_many :questions
end
