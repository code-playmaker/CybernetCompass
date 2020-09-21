Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  devise_scope :user do
    get 'new_assignment', to: 'users/registrations#new_assignment'
    post 'create_assignment', to: 'users/registrations#create_assignment'
  end
  root 'tops#index'
end
