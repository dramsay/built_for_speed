ActionController::Routing::Routes.draw do |map|
  map.resources :posts

  map.root :controller => "posts"

end
