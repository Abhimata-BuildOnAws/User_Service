Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/user/health_check', to: 'application#health_check'
  post '/user/create', to: 'user#create_user'
  post '/user/get_user', to: 'user#get_user'
  post '/user/leaderboard', to: 'user#leaderboard'
  post '/user/update_environmental_contribution', to: 'user#update_environmental_contribution'
end
