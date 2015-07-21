Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :inbound, defaults: { format: 'xml'}
  post 'inbound' => 'inbound'
  resources :users do
    resources :messages, only: [:index, :new, :create, :show]
    resources :contacts
  end
  resources :inbounds
end
