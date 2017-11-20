Rails.application.routes.draw do
  resources :reports

  get 'home/index'
  get 'home/about'
  get 'home/contact'

  namespace :api do 
    jsonapi_resources :menus
  end

  resources :menus do
    collection do
      get 'makemenu'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
