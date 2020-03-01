class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	#Require user logged in by default
	before_action :require_user

	#Make logged_in accessible from any view
	helper_method :current_user, :logged_in?

	#Check if user is logged in
	def logged_in?
		!!current_user
	end

	#Give access to logged in features if user is logged in
	def require_user
		if !logged_in?
			flash[:notice] = "You must be logged in to perform this action"
			redirect_to login_path
		end
	end

	def current_user
		if session[:student_id]
			@current_user ||= Student.find(session[:student_id])
		end
	end
end
