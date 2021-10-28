Rails.application.routes.draw do

#admin
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
namespace :admins do

  resources :users,only: [:show,:edit,:update]
      get 'top'=>'users#top'
  resources :genres,only: [:index,:create,:edit,:update]
  resources :locations,only: [:index,:create,:edit,:update]

  root to: 'users#top'

end


#customers
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
scope module: :customers do

  resources :users,only: [:index, :show, :new, :edit, :update] do
    resource :relationships, only: [:create, :destroy, :index]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'quit'=>'users#quit'
      get 'out'=>'users#out'
  end
  resources :favorites,only: [:index]
  resources :genres,only: [:index]
  resources :locations,only: [:index]
  resources :relationships,only: [:index]
  resources :posts do
        resource :favorites, only: [:create, :destroy]
        resource :likes,only: [:create, :destroy]
  end

  get '/search' => 'search#search'

   root to: 'likes#about'
     get	'top' => 'likes#top'

  post "posts/:id/destroy" => "posts#destroy"

  devise_scope :user do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end
end

end
