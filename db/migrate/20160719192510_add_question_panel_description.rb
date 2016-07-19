class AddQuestionPanelDescription < ActiveRecord::Migration
  def change
    add_column :questions, :panel_title, :string
    add_column :questions, :panel_description, :text
  end
end
