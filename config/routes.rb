Rails.application.routes.draw do
  
  get 'articles/index'

  get 'article/index'

  resources :articles
# For details on the DSL available within this file, 
#see http://guides.rubyonrails.org/routing.html

	root 'page#home'
	get 'about' , to:'page#about'
	resources :articles
	
	get 'signup' , to: 'users#new'
	resources :users, except: [:new]
	
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
	resources :categories, except: [:destroy]

end
