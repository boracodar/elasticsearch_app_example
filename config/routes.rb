ElasticsearchAppExample::Application.routes.draw do
  root :to => 'movies#index'

  resources :movies do
    collection do
      get :search
    end
  end
end
