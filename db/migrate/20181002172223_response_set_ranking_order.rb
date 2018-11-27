class ResponseSetRankingOrder < ActiveRecord::Migration
  def change
    add_column :response_sets, :first, :string
    add_column :response_sets, :second, :string
    add_column :response_sets, :third, :string
    add_column :response_sets, :fourth, :string
    add_column :response_sets, :fifth, :string
    add_column :response_sets, :sixth, :string
  end
end
