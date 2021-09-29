Rails.application.routes.draw do
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
	namespace :api, defaults:{format: :json} do
		namespace :v1 do
			resources :profiles
			resources :posts	
	    resources :users
	    resources :comments
	    resources :likes
      get '/post_likes', to: 'likes#post_likes'
		end
	end
end
