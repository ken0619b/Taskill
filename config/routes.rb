Rails.application.routes.draw do

  # Users-Tasks # view側で制御する
  # resources :users, shallow: true do
  #   member do
  #     resources :tasks
  #   end
  # end

  # Tasks - Plans
  resources :tasks, shallow: false do
    resources :plans
  end

  # Users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
