Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "mission", to: "pages#mission"
  
  root to: "pages#home"
end
