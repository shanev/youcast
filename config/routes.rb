ActionController::Routing::Routes.draw do |map|

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'

  map.resources :clips
  map.resources :featured_clips
  map.resource :home
  map.resources :playlists, :has_many => [ :tracks ]
  map.resources :users
  map.resource :session
  
  map.connect '', :controller => "homes", :action => 'show'

  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
