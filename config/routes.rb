Rails.application.routes.draw do
  root 'users#home'
 
    resources :lists do
      resources :tasks do
        member do
          patch :done
        end
      end
    end

   resources :users do
     resources :lists 
   end

 

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"


  delete "/logout", to: "sessions#destroy"

  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
