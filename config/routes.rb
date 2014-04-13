Collaboraid::Application.routes.draw do
  devise_for :users
  resources :projects
  root :to => 'home#index'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'addproject', to: 'home#addproject'
end
