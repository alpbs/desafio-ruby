Rails.application.routes.draw do
  root 'stores#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :stores, path: 'stotes', controllers: { sessions: "store/sessions" }
  
  resources :stores, only: [:index, :show] do
    get :import_catalog, to: "stores#import_catalog", as: 'import_catalog'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
