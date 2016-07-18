class SurveysController < ApplicationController
  before_action :fetch_survey

  def take

    ### find or create a response set
    @response_set = ResponseSet.where(user_token: params[:user_token]).first_or_create(survey: @survey, participant_identifier: @survey.next_question_set.participant_identifier)

    ### update the response set if we have one
    @response_set.update_attributes(response_set_params) if params[:response_set]

    ### grab the next question set
    @question_set = @response_set.unanswered_question_sets.first

    if @question_set.nil?
      @response_set.update_attribute(:completed_at, Time.now)
      render :complete
    end
  end

  def complete
  end

  private

  def response_set_params
    params.require(:response_set).permit(responses_attributes: [:question_set_id, :question_id])
  end

  def fetch_survey
    @survey = Survey.find_by_study_identifier params[:study_identifier]
  end
end
