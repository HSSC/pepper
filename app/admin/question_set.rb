ActiveAdmin.register QuestionSet do

  menu priority: 2, label: 'Sets'

  permit_params :survey_id, :participant_identifier, :title, :subtitle,
                questions_attributes: [:id, :panel_title, :panel_description, :_destroy, question_dimensions_attributes: [:id, :count, :image, :legend_description, :help_text_image, :help_text_description, :_destroy]]

  filter :survey_id, as: :select, collection: proc { Survey.all }
  filter :participant_identifier, as: :select

  index title: 'Sets' do
    column :participant_identifier
    column :survey_id
    column :title
    column :subtitle
    column :used
    column 'Options' do |q|
      q.questions.count
    end

    actions
  end

  form title: 'Edit Set' do |f|
    semantic_errors *f.object.errors.keys

    inputs "Details" do
      input :participant_identifier
      input :survey
      input :title
      input :subtitle
    end

    inputs "Questions" do
      has_many :questions, heading: '', allow_destroy: true, new_record: true do |a|
        a.input :panel_title
        a.input :panel_description

        a.has_many :question_dimensions, heading: 'Option', allow_destroy: true, new_record: true do |b|
          b.input :count
          b.input :image, :as => :file, :hint => image_tag(b.object.image.present? ? b.object.image.url : '/images/original/missing.png')
          b.input :legend_description
          b.input :help_text_image
          b.input :help_text_description
        end
      end
    end

    actions
  end

  show title: :question_set_title do |s|
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
          image_tag(s.question_image.present? ? s.question_image.url : '/images/original/missing.png')
        end

        row :panel_title
        row :panel_description

        row :question_dimensions do |s|
          table_for s.question_dimensions do
            column :count
            column :image do |t|
              image_tag(t.image.present? ? t.image.url : '/images/original/missing.png')
            end
            column :legend_description
            column :help_text_image
          end
        end
      end
    end
  end
end
