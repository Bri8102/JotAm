Rails.application.routes.draw do

  resources :lists do
    resources :tasks do
     member do
      patch :done
     end
   end
 end

  root "lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
