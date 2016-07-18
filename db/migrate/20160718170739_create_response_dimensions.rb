class CreateResponseDimensions < ActiveRecord::Migration
  def change
    create_table :response_dimensions do |t|
      t.integer :count
      t.string :color
      t.belongs_to :response
      t.timestamps null: false
    end

    add_attachment :response_dimensions, :image
    add_column :responses, :title, :string
    add_column :responses, :subtitle, :string
  end
end
