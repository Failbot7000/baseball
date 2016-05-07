Rails.application.routes.draw do
  resources :games
  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'games' => 'games#index'
  get 'up_team_one' => 'games#up_team_one'
  get 'up_team_two' => 'games#up_team_two'

   resources :users
end