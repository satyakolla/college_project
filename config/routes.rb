Rails.application.routes.draw do
 
  
  resources :teachers
  #devise_for :users
  root to: "colleges#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :colleges do
    member do
      get 'download_pdf'

    end
  end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    resources :colleges
    resources :teachers
      end
    end
    devise_for :users, controllers: {registrations: 'users/registrations'}
end
