class Survey < ActiveRecord::Base
  validates :study_identifier, presence: true, uniqueness: true
  validates :total_n, presence: true, numericality: true
  validates :default_legend_image, presence: true

  has_many :question_sets, dependent: :destroy
  has_many :questions, :through => :question_sets

  after_update :regenerate_question_images, if: :total_n_changed?

  has_attached_file :default_legend_image
  do_not_validate_attachment_file_type :default_legend_image

  accepts_nested_attributes_for :question_sets, allow_destroy: true

  RANKING_ORDER = [ ["PE", 'Pulmonary embolism: clot in the lung', 'Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital.'],
                    ["DVT", 'Deep vein thrombosis (DVT) : Clot in the leg', 'Risk of a clot in the leg, it can cause leg pain or swelling, but also can occur with no symptoms. It may require spending 1-2 days in the hospital.'],
                    ["MINBLEEDSLOW", 'Minor bleeding causing slow wound healing, bruising, pain or stiffness', 'Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood and may slow down recovery.'],
                    ["MAJBLEEDINFECT", 'Major bleeding causing infection of the leg and removal of the implant.', 'Risk of a major bleeding that requires another operation to replace an infected joint (inpatient stay is needed)'],
                    ["200COPAY", '$200 copay', 'A copay of $200'],
                    ["BLOODTEST", 'Blood test', 'Blood test requiring a visit to the provider twice a week for 4 weeks']
  ]

  def next_question_set
    question_set = question_sets.where(used: false).first

    if question_set.nil?
      QuestionSet.where(survey_id: self.id).update_all(used: false)
      question_set = question_sets.first
    end

    QuestionSet.where(survey_id: self.id, participant_identifier: question_set.participant_identifier).update_all(used: true)
    question_set
  end

  def title
    study_identifier
  end

  private

  def regenerate_question_images
    self.questions.each do |q|
      q.save
    end
  end
end
