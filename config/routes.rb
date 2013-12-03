Campcollab::Application.routes.draw do

  root :to => 'hosts#index'

  resources :hosts, only: [] do
    resources :events, only: [:index, :create, :destroy, :show]
  end

  resources :hosts, only: [:create]
  # resources :event, only: [] do
  #   resources :guests
  # end

  # resources :guests, only: [] do
  #   resources :items
  # end

  resources :sessions, only: [:create, :destroy, :new]
  get 'logout', :to => 'sessions#destroy'

  get '/hosts/:host_id/events/:id/:event_token' => 'events#show'


  resources :events, only: [] do
    resources :items, except: [:show, :edit, :new]
  end

  match  '/events/:event_id/items/:id.important' => 'items#important', via: [:get]


end
