TravelStories::Application.routes.draw do
  root :to => 'pages#home'
  resources :places
  resources :users, :only => [:new]
end
