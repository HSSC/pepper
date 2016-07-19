ActiveAdmin.register QuestionSet do

  menu priority: 2, label: 'Sets'

  permit_params :survey_id, :participant_identifier, :title, :subtitle,
                questions_attributes: [:id, :_destroy, question_dimensions_attributes: [:id, :count, :image, :legend_description, :help_text, :_destroy]]

  filter :survey_id, as: :select, collection: proc { Survey.all }
  filter :participant_identifier, as: :select

  index do
    column :participant_identifier
    column :survey_id
    column :title
    column :subtitle
    column :used

    actions
  end

  form do |f|
    semantic_errors *f.object.errors.keys

    inputs "Details" do
      input :participant_identifier
      input :survey
      input :title
      input :subtitle
    end

    inputs "Questions" do
      has_many :questions, heading: '', allow_destroy: true, new_record: true do |a|
        a.has_many :question_dimensions, heading: 'Option', allow_destroy: true, new_record: true do |b|
          b.input :count
          b.input :image, :as => :file, :hint => image_tag(b.object.image.url)
          b.input :legend_description
          b.input :help_text
        end
      end
    end

    actions
  end

  show do |s|
    panel "Details" do
      attributes_table_for question_set do
        row :participant_identifier
        row :survey
        row :title
        row :subtitle
        row :used
      end
    end

    panel "Questions" do
      attributes_table_for question_set.questions do
        row :question_image do |s|
          image_tag(s.question_image.url)
        end

        row :question_dimensions do |s|
          table_for s.question_dimensions do
            column :count
            column :image do |t|
              image_tag(t.image.url)
            end
            column :legend_description
            column :help_text
          end
        end
      end
    end
  end



end
