class SurveysController < ApplicationController
  before_action :fetch_survey

  def index
    @user_token = params[:user_token] || random_string
    @response_set = ResponseSet.where(user_token: params[:user_token]).first_or_create(survey: @survey, participant_identifier: 'PAT0', user_token: @user_token)
    @ranking_order = Survey::RANKING_ORDER.shuffle
  end

  def take

    ### find or create a response set
    @response_set = ResponseSet.where(user_token: params[:user_token]).first_or_create(survey: @survey, participant_identifier: 'PAT0')

    ### update the response set if we have one
    @response_set.update_attributes(response_set_params) if params[:response_set]

    ### grab the next question set
    @question_set = @response_set.unanswered_question_sets.first

    ### grab the progress bar percentage
    @progress_bar_percentage = @response_set.progress_bar_percentage

    if @question_set.nil?
      @response_set.update_attribute(:completed_at, Time.now)
      render :complete
    end
  end

  def complete
  end

  private

  def response_set_params
    params.require(:response_set).permit(:first, :second, :third, :fourth, :fifth, :sixth, responses_attributes: [:question_set_id, :question_id, :weight])
  end

  def fetch_survey
    @survey = Survey.find_by_study_identifier params[:study_identifier]
  end
end
