class QuestionSet < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, dependent: :destroy

  validates :participant_identifier, presence: true
  validates :survey, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true

  def question_set_title
    "#{survey.study_identifier} Survey - Set for #{participant_identifier}"
  end
end
