class QuestionSet < ActiveRecord::Base
  serialize :descriptors

  validates :participant_identifier, presence: true

  belongs_to :survey
  has_many :questions
end
