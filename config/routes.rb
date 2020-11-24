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
     resources :lists do
      resources :tasks
     end
   end

 

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"


  delete "/logout", to: "sessions#destroy"

  # get '/', to: 'users#home'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
