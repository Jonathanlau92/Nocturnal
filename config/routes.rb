Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :leagues
  get "mission", to: "pages#mission"

  # Stripe payment path
  mount StripeEvent::Engine, at: '/stripe/webhook'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: :checkout_create
    get 'cancel', to: 'checkout#cancel', as: :checkout_cancel
    get 'success', to: 'checkout#success', as: :checkout_success
  end
  
  root to: "pages#home"
end
