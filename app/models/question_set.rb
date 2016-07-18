class QuestionSet < ActiveRecord::Base
  belongs_to :survey
  has_many :questions

  validates :participant_identifier, presence: true
  validates :survey, presence: true

end
