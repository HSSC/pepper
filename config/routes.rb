Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'surveys/:study_identifier/take' => 'surveys#take', as: :survey_new
  patch 'surveys/:study_identifier/take/:user_token' => 'surveys#take', as: :survey_update

  get 'surveys/:study_identifier/take/:user_token' => 'surveys#index'

  resources :messages, only: [:show]

  root 'surveys#index'
end
