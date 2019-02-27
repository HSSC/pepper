class ChangeWeightToDecimal < ActiveRecord::Migration
  def up
    change_column :responses, :weight, :decimal, precision: 15, scale: 10
  end

  def down
    change_column :responses, :weight, :integer
  end
end
