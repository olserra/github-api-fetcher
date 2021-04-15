Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "profiles#index"

  get "/profiles", to: "profiles#index"
  get "/search", :to => "profiles#index"
end
