Rails.application.routes.draw do

#admin
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
namespace :admins do

  resources :users,only: [:index,:show,:edit,:update]
      get 'top'=>'users#top'
  resources :genres,only: [:index,:create,:edit,:update]
  resources :locations,only: [:index,:create,:edit,:update]

end


#customers
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
scope module: :customers do

  resources :users,only: [:show,:new,:edit,:update] do
      get 'users/quit'=>'users#quit'
      get 'users/out'=>'users#out'
      resource :relationships, only: [:create, :destroy]
       get 'relationships/followers' => 'relationships#followers', as: 'followers'
       get 'relationships/followings' => 'relationships#followings', as: 'followings'
    end
  resources :genres,only: [:index]
  resources :locations,only: [:index]
  resources :relationships,only: [:index,:create,:destroy]
  resources :posts do
        resource :favorites, only: [:create, :destroy]
        resource :likes,only: [:create, :destroy]
  end

   root to: 'likes#top'
     get	'about' => 'likes#about'

  post "posts/:id/destroy" => "posts#destroy"
end

end
