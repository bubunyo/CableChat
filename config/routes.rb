Rails.application.routes.draw do
   
  root 'rooms#new'
  post 'rooms/enter'
  get 'rooms/:room_id/leave', to: 'rooms#leave', as: 'rooms_leave'
  
  get 'rooms/:room_name', to: 'rooms#room', as: 'rooms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
