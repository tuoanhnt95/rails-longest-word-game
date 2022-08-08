Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'new', to: 'games#new', as: :new
  # post the input and the time
  post 'score', to: 'games#score', as: :play
  # get the info from score
  get 'score', to: 'games#git'
end
