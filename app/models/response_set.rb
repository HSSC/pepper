class ResponseSet < ActiveRecord::Base
  include Tokenable

  belongs_to :survey
  has_many :responses

  validates :survey_id, presence: true
  validates :user_token, uniqueness: true

  accepts_nested_attributes_for :responses

  def unanswered_question_sets
    QuestionSet.where(survey_id: survey_id, participant_identifier: participant_identifier).where.not(id: responses.map{|r| r.question.question_set_id}.uniq)
  end
end
