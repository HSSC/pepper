class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response_set_id
      t.integer :question_set_id
      t.integer :question_id
      t.text :descriptors
      t.text :dimensions

      t.timestamps null: false
    end
  end
end
