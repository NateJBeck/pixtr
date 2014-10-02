Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root "galleries#index"
  resources :galleries do
    resources :images#, only: [:show, :new, :create, :edit, :update, :delete]
  end

  resources :users, only: [:new, :create]

  # get "/" => "galleries#index"  #when the user goes to /, run galleries#index
  #                               #part before # is name of Controller, after # is name of method after Controller
  # get "/galleries/new" => "galleries#new"
  # post "/galleries" => "galleries#create"
  #
  # get "/galleries/:id" => "galleries#show"
  # get "/galleries/:id/edit" => "galleries#edit"
  # patch "/galleries/:id" => "galleries#update"
  # delete "/galleries/:id" => "galleries#destroy"

end
