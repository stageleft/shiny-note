Rails.application.routes.draw do
  get 'event_sheet', to: 'event_sheet#index'
  get 'event_sheet/index'

  get  'sidol', to: 'sidol#index'
  get  'sidol/index'
  get  'sidol/edit/:id',   to: 'sidol#edit'
  post 'sidol/update/:id', to: 'sidol#update'
  get  'sidol/delete/:id', to: 'sidol#delete'

  get  'pidol', to: 'pidol#index'
  get  'pidol/index'
  get  'pidol/edit/:id',   to: 'pidol#edit'
  post 'pidol/update/:id', to: 'pidol#update'
  get  'pidol/delete/:id', to: 'pidol#delete'

  get  'event_list', to: 'event_list#index'
  get  'event_list/index'
  get  'event_list/edit_event/:id', to: 'event_list#edit_event'
  get  'event_list/edit_choice/:id', to: 'event_list#edit_choice'
  post 'event_list/update_event', to: 'event_list#update_event'
  get  'event_list/delete_event/:id', to: 'event_list#delete_event'
  post 'event_list/update_choice', to: 'event_list#update_choice'
  get  'event_list/delete_choice/:id', to: 'event_list#delete_choice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index/index'
  get 'index', to: 'index#index'
  get '', to: 'index#index'
end
