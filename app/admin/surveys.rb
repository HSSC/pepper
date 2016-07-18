ActiveAdmin.register Survey do

  permit_params :study_identifier, :total_n, :default_set_title, :default_set_subtitle, :default_legend_image

  filter :study_identifier

  index do
    selectable_column
    column :study_identifier
    column :total_n
    column :default_set_title
    column :default_set_subtitle
    column :default_legend_image do |s|
      image_tag(s.default_legend_image.url)
    end
    actions
  end

  form do |f|
    semantic_errors
    inputs "Survey Details" do
      input :study_identifier
      input :total_n
      input :default_set_title
      input :default_set_subtitle
      input :default_legend_image, :as => :file, :hint => image_tag(f.object.default_legend_image.url)
    end

    inputs "Question Sets" do
      has_many :question_sets, heading: 'Question Sets', allow_destroy: true, new_record: true do |a|
        a.input :participant_identifier
        a.input :title
        a.input :subtitle
      end
    end
    actions
  end

  show do |s|
    panel "Survey Details" do
      attributes_table_for survey do
        row :study_identifier
        row :total_n
        row :default_set_title
        row :default_set_subtitle
        row :default_legend_image do
          image_tag(s.default_legend_image.url)
        end
      end
    end
    active_admin_comments
  end
end
