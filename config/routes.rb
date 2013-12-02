Campcollab::Application.routes.draw do

  root :to => 'hosts#index'

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

  resources :events, only: [] do
    resources :items, except: [:show, :edit, :new]
  end

  match  '/events/:event_id/items/:id.important' => 'items#important', via: [:get]


end
