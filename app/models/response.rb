class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :response_set

  has_many :response_dimensions
  has_many :response_attributes

  before_create :persist_setup

  validates :response_set, presence: true
  validates :question, presence: true

  def weight=(value)
    orig_value = value.to_i
    new_value = 0

    if orig_value <= 4
      new_value = 5 - orig_value
    elsif orig_value >= 6
      new_value = orig_value - 5
    end

    super(new_value)
  end

  private

  def persist_setup
    survey = question.question_set.survey

    self.title = question.question_set.title.blank? ? survey.default_set_title : question.question_set.title
    self.subtitle = question.question_set.subtitle.blank? ? survey.default_set_subtitle : question.question_set.subtitle

    self.question.question_dimensions.each do |qd|
      rd = self.response_dimensions.new count: qd.count, legend_description: qd.legend_description, help_text: qd.help_text, help_text_description: qd.help_text_description
      rd.image = qd.image
    end

    self.question.question_attributes.each do |qa|
      ra = self.response_attributes.new description: qa.description, panel_title: qa.panel_title, panel_description: qa.panel_description
      ra.image = qa.image
    end
  end
end
