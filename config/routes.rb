Potluck::Application.routes.draw do

  root :to => "events#index"

  resources :events, only: [:show]

end
