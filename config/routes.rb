Rails.application.routes.draw do
	#Courses Controlller
	get 'courses/new', to: 'courses#new'
	root 'courses#index'
	post 'course_enroll', to: 'student_courses#create'

	#Pages Controller
	get 'pages/about'
	get 'about', to: 'pages#about'

	#Logins Controller
	get 'login', to: 'logins#new'
	post 'login', to: 'logins#create'
	delete 'logout', to: 'logins#destroy'

	#Students Controller
	resources :students, except: [:destroy]
end
