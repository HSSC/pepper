module QuestionImageGenerator
  extend ActiveSupport::Concern

  included do
    extend Paperclip::Glue
    has_attached_file :question_image
    do_not_validate_attachment_file_type :question_image

    before_save :generate_image

    def generate_image
      file = Tempfile.new(['question', '.png'])

      survey = question_set.survey
      total_n = survey.total_n
      base_image = Rails.root.join(survey.default_legend_image.path)

      script = "montage"

      total_displayed = 0

      self.question_dimensions.each do |qd|
        total_displayed += qd.count
        qd.count.times do
          script += " #{Rails.root.join(qd.image.path)}"
        end
      end

      (total_n - total_displayed).times do
        script += " #{base_image}"
      end

      script += " -tile 20x -geometry +2+2 #{file.path}"

      # generate the montage
      # montage source_images/Y_person.png source_images/G_person.png -tile 20x -geometry +2+2 montage.jpg
      `#{script}`

      self.question_image = file
    end
  end
end

