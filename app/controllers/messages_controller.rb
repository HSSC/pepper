class MessagesController < ApplicationController
  def show
    @qd = QuestionDimension.find params[:id]
  end
end
