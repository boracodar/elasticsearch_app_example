ElasticsearchAppExample::Application.routes.draw do
  root :to => 'movies#index'

  resources :movies
end
