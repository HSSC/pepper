class CreateResponseSets < ActiveRecord::Migration
  def change
    create_table :response_sets do |t|
      t.string :user_token
      t.integer :survey_id
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
