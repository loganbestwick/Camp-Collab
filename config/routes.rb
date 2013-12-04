Campcollab::Application.routes.draw do



  resources :hosts, only: [:create] do
    resources :events, only: [:index, :create, :destroy, :show]
  end
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
    resources :guests
  end

  root :to => 'hosts#index'

  match  '/events/:event_id/items/:id.important' => 'items#important', via: [:get]


end
