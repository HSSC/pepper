Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'surveys' => 'surveys#error'
  get 'surveys/:study_identifier/intro/:user_token' => 'surveys#index'
  get 'surveys/:study_identifier/take/:user_token' => 'surveys#take', as: :survey_new
  patch 'surveys/:study_identifier/take/:user_token' => 'surveys#take', as: :survey_update


  resources :messages, only: [:show]

  root 'surveys#error'
end
