module QuestionImageGenerator
  extend ActiveSupport::Concern

  included do 
    extend Paperclip::Glue
    has_attached_file :question_image
    do_not_validate_attachment_file_type :question_image

    before_save :generate_image

    def generate_image
      file = Tempfile.new(['question', '.png'])

      total_n = self.survey.total_n
      base_image = self.survey.default_legend_image
      images_path = Rails.root.join("app/assets/images/studies", self.survey.study_identifier)

      images = {}
      self.dimensions.each do |k,v|
        images[v['DIMENSION']] = v['COUNT'].to_i
      end

      script = "montage"

      total_displayed = images.values.inject(:+)

      images.each do |color_code, num|
        num.times do
          script += " #{images_path}/#{color_code}_#{base_image}"
        end
      end

      (total_n - total_displayed).times do
        script += " #{images_path}/#{base_image}"
      end

      script += " -tile 20x -geometry +2+2 #{file.path}"

      # generate the montage
      # montage source_images/Y_person.png source_images/G_person.png -tile 20x -geometry +2+2 montage.jpg

      `#{script}` 

      self.question_image = file
    end
  end
end

