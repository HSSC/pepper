class AddWeightToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :weight, :int
  end
end
