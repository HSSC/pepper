class RemoveColorAttribute < ActiveRecord::Migration
  def change
    remove_column :question_dimensions, :color
    remove_column :response_dimensions, :color
  end
end
