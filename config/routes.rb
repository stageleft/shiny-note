Rails.application.routes.draw do
  get 'event_list', to: 'event_list#index'
  get 'event_list/index'
  get 'event_list/edit_event/:id', to: 'event_list#edit_event'
  get 'event_list/edit_choice/:id', to: 'event_list#edit_choice'
  post 'event_list/update_event', to: 'event_list#update_event'
  get 'event_list/delete_event/:id', to: 'event_list#delete_event'
  post 'event_list/update_choice', to: 'event_list#update_choice'
  get 'event_list/delete_choice/:id', to: 'event_list#delete_choice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
