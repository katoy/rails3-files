Files::Application.routes.draw do
  root :to => "downloads#index"
  resources :downloads
end
