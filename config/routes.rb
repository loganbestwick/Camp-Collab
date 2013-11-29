Potluck::Application.routes.draw do

  resources :events, only: [:update, :show, :create]
  resources :users do
    resources :events
  end

end
