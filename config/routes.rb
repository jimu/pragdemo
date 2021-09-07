Rails.application.routes.draw do
  resources :users
  get 'say/hello'
  get 'say/goodbye'
end
