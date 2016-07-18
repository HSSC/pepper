class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :study_identifier
      t.integer :total_n
      t.string :default_set_title
      t.text :default_set_subtitle

      t.timestamps null: false
    end

    add_attachment :surveys, :default_legend_image
  end
end
