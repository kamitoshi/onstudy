Rails.application.routes.draw do
  root 'home#top'
  ActiveAdmin.routes(self)
  devise_for :teachers
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :teachers, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
