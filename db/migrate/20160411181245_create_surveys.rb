class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :study_identifier
      t.integer :total_n
      t.string :default_set_title
      t.text :default_set_subtitle
      t.text :default_legend_description
      t.string :default_legend_image
      t.text :legend_definitions
      t.text :legend_help_text

      t.timestamps null: false
    end
  end
end
