Rails.application.routes.draw do
  get 'surveys/:study_identifier/take' => 'surveys#take', as: :survey_new
  patch 'surveys/:study_identifier/take/:user_token' => 'surveys#take', as: :survey_update

  get 'surveys/:study_identifier/take/:user_token' => 'surveys#index'

  root 'surveys#index'
end
