Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health_check', to: 'application#health_check'
  get '/current_location', to: 'application#current_location'
  post '/browse', to: 'user#browse'
  post '/user/create', to: 'user#create_user'
  post '/user/get_user', to: 'user#get_user'
  post '/user/update_tree_points', to: 'user#update_tree_points'
  post '/user/update_pollution', to: 'user#update_pollution'
end
