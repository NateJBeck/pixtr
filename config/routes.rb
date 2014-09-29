Rails.application.routes.draw do
  get "/" => "galleries#index"  #when the user goes to /, run galleries#index
                                #part before # is name of Controller, after # is name of method after Controller
  get "/galleries/new" => "galleries#new"
  post "/galleries" => "galleries#create"

  get "/galleries/:id" => "galleries#show"

  get "/galleries/:id/edit" => "galleries#edit"

end
