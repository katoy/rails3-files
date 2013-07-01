Files::Application.routes.draw do
  root :to => "downloads#index"
  # resources :downloads
  resources :downloads do
    member do
      get :act1
    end
    collection do
      get :indexKaminari
      get :indexWicegrid
    end
  end
  
end
