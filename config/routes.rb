Rails.application.routes.draw do

  root to: "games#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'

  get 'profile', to: 'profile#show'
  get 'profile/edit', to: 'profile#edit'
  post 'profile', to: 'profile#update'

  get 'schools/teachers', to: 'schools#teachers'
  get 'schools/students', to: 'schools#students'

  devise_for :users
  resources :schools
  resources :classrooms
  resources :questions
end
