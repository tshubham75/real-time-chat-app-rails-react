# config/routes.rb
Rails.application.routes.draw do
  # WebSocket route for ActionCable
  mount ActionCable.server => '/cable'
   resources :messages, only: [:create]
end
