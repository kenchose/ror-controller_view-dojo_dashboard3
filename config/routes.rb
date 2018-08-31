Rails.application.routes.draw do
  get 'dojos' => 'dojos#index'
  get 'dojos/new' => 'dojos#new'
  post 'dojos' => 'dojos#create'
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'
  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id/destroy' => 'dojos#destroy'
  # resource :dojos for all 7 restful routes OR just want what you only need resources :dojos, only: [:index, :show, etc] (can also use except instead of only)
end
