class Survey < ActiveRecord::Base
  serialize :legend_definitions
  serialize :legend_help_text

  validates :study_identifier, presence: true, uniqueness: true
  validates :total_n, presence: true, numericality: true
  validates :default_legend_image, presence: true
  validates :legend_definitions, presence: true

  has_many :question_sets
end
