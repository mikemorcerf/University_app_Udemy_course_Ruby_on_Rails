class CoursesController < ApplicationController
	#Ignore default action from application controller
	skip_before_action :require_user

	def index
		@courses = Course.all
	end

	def new
		
	end
end
