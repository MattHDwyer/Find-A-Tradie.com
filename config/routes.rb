Rails.application.routes.draw do
  resources :ratings
  resources :business_profiles
  get "contacts/new/:id" => "contacts#new"
  resources :contacts
  resources :dashboards
  resources :galleries
  
  # devise part below
  resources :charges
  # devise part ends

  devise_for :users, :controllers => { :registrations => "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get "/gettrade" => "json#index"
  get "/getlocation" => "json#location"
  get "/search" => "home#search"
  get "dashboards" => "dashboards#index"
  get "dashboards/signout" => "dashboards#signout"
  post "business_profiles/:id/ratings" => 'ratings#create'
  get "galleries/new/:id" => "galleries#new"
end
