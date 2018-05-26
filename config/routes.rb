Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "plz#index"
  
  post "plz/create" => "plz#create"
  
  get "plz/login/:email" => "plz#login"
end
