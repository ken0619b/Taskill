Rails.application.routes.draw do
  # Tasks - Plans
  resources :tasks, shallow: false do
    resources :plans, except: [:index]
  end

  # Users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
