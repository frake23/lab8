Rails.application.routes.draw do
  root to: 'home#index'
  post '/', to: 'home#calc'
  get '/history', to: 'home#history'

end
