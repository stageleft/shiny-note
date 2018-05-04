Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index/index'
  get 'index', to: 'index#index'
  get '', to: 'index#index'
end
