Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "profiles#index"

  get "/profiles", to: "profiles#index"
  post "/profiles", to: "profiles#create"
  get "/search", to: "profiles#index"
  get "/comparator", :to => "profiles#comparator"
end
