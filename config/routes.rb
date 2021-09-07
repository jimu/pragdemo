Rails.application.routes.draw do
  root 'directory#index', as: 'directory_index'
  get 'directory/index'
  resources :users
  get 'say/hello'
  get 'say/goodbye'

end
