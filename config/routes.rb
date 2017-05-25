Rails.application.routes.draw do

  

  	resources :posts do
		collection  do
			get 'about'
			get 'getDetail'
			get 'threemissing'
			get 'threefound'
			get 'getallmissing'
			get 'getallfound'
			post 'makepost'
			post 'makepostnot'
			get 'search'
		end
	end

	resources :users do
		collection do
			get 'logout'
			post 'login'
			post 'alreadyexist'
			post 'checklogin'
			post 'createUser1'
			post 'getposter'
			post 'getmypost'
		end
	end

	resources :unregister do
		collection do
			post 'createUser'
		end
	end

	resources :phonenumbers do
		collection do
			post 'verify'
		end
	end

	resources :admin do
		collection do
			get 'allusers'
		end
	end

	root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
