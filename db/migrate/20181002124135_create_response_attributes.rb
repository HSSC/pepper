class CreateResponseAttributes < ActiveRecord::Migration
  def change
    create_table :response_attributes do |t|
      t.integer :response_id
      t.text :description
      t.string :panel_title
      t.text :panel_description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
