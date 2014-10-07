Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root "galleries#index"

  resources :users, only: [:new, :create]

  resources :galleries do
    resources :images     #, only: [:show, :new, :create, :edit, :update, :delete]
  end

  resources :images, only: [] do          #comments nested inside image
    resources :comments, only: [:create]  #we now have an image_id param to be able to call for every comment
  end

  resources :groups, only: [:index, :new, :create, :show] do
    resources :group_memberships, only: [:create]
  end
end
  # get "/" => "galleries#index"  #when the user goes to /, run galleries#index
  #                               #part before # is name of Controller, after # is name of method after Controller
  # get "/galleries/new" => "galleries#new"
  # post "/galleries" => "galleries#create"
  #
  # get "/galleries/:id" => "galleries#show"
  # get "/galleries/:id/edit" => "galleries#edit"
  # patch "/galleries/:id" => "galleries#update"
  # delete "/galleries/:id" => "galleries#destroy"
