class RemoveDimensionsFromResponse < ActiveRecord::Migration
  def change
    remove_column :responses, :dimensions
  end
end
