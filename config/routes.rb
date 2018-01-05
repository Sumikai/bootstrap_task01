Rails.application.routes.draw do
  get '/webpages', to: 'webpages#index'
  
  resources :webpages do
    collection do
      post :confirm
    end
  end
end
