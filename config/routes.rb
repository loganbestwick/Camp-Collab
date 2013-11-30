Potluck::Application.routes.draw do

  # resources :events, only: [:update, :show, :create]
  # resources :users do
  #   resources :events
  # end


  resources :hosts
  get '/' => 'hosts#new'
  get '/login' => 'sessions#new'
  root :to => 'sessions#new'
  resources :sessions

end
