class SurveysController < ApplicationController
  before_action :fetch_survey

  def show

  end

  def take

  end

  private

  def fetch_survey
    @survey = Survey.find params[:id]
  end
end
