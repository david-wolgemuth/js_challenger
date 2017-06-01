Rails.application.routes.draw do

  get 'tests/new'

  get 'tests/edit'

  root  :to => redirect('/challenges')

  resources :sessions
  resources :users
  resources :challenges do
    resources :tests
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
