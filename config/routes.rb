Rails.application.routes.draw do
  #get '/top' => 'homes#top'
  root :to => 'homes#top'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
