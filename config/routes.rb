Rails.application.routes.draw do

  devise_for :users
	root 'static_pages#index'
	get 'about' => "static_pages#about", :as => "about"
	get 'blog' => "static_pages#blog", :as => "blog"

	#get links for the about page
	#get link_to for the blog
	#get link_to for the 


	resources :courses, only: [:index, :show]
	resources :lessons, only: [:show]
	namespace :instructor do
		resources :sections, only: [] do
			resources :lessons, only: [:new, :create]
		end
		resources :courses, only: [:new, :create, :show, :index] do
			resources :sections, only: [:new, :create] 
				
			
		end
	end
end
