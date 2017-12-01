Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resource :players, only: [ :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
