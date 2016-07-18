class AddDescriptionAndHelpToQuestionDimension < ActiveRecord::Migration
  def change
    add_column :question_dimensions, :legend_description, :string
    add_column :question_dimensions, :help_text, :string
    add_column :response_dimensions, :legend_description, :string
    add_column :response_dimensions, :help_text, :string
  end
end
