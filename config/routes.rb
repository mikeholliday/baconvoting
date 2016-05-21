Rails.application.routes.draw do

  root 'votes#index'
  resources :votes
  resources :participants
  resources :reports

end
