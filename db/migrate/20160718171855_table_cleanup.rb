class TableCleanup < ActiveRecord::Migration
  def change
    remove_column :responses, :descriptors, :dimensions
  end
end
