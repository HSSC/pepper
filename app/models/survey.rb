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
    puts "#"*50
    puts "inside"
    puts "#"*50
    self.questions.each do |q|
      puts "regen"
      q.save
      #q.generate_image
    end
  end
end
