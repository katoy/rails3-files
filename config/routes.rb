Files::Application.routes.draw do
  root :to => "downloads#indexKaminariTable"

  # resources :downloads
  resources :downloads do
    member do
      get :act1
    end
    collection do
      get :indexKaminari
      get :indexKaminariTable
      get :indexWicegrid
    end

  end

end
