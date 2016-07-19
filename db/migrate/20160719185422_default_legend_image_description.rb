class DefaultLegendImageDescription < ActiveRecord::Migration
  def change
    add_column :surveys, :default_legend_description, :string
  end
end
