Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "profiles#index"
  get "/show", to: "profiles#show"

  resources :profiles, only: %i[index create show] do
    collection do             
      get :compare    
    end
  end

  resources :comparisons, only: %i[index new create show] 

end
