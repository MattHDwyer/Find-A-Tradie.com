Rails.application.routes.draw do
  resources :ratings
  resources :business_profiles
  resources :contacts
  devise_for :users, :controllers => { :registrations => "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
