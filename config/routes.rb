Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check
  
  ## resources creates all 5 API endpoints
  resources :tasks
end
