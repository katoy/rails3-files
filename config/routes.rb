Files::Application.routes.draw do
  root :to => "downloads#index"
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

    get 'page/:@age', :action => :index, :on => :collection
  end
  
end
