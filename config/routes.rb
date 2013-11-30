Potluck::Application.routes.draw do

  root :to => 'events#index'

  resources :hosts, only: [] do
    resources :events, only: [:index, :create, :destroy, :show]
  end

  # resources :event, only: [] do
  #   resources :guests
  # end

  # resources :guests, only: [] do
  #   resources :items
  # end

  resources :event, only: [] do
    resources :items, except: [:show, :edit, :new]
  end


end
