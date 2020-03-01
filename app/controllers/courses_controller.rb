class CoursesController < ApplicationController
	#Ignore default action from application controller
	skip_before_action :require_user

	helper_method :has_courses?

	def index
		@courses = Course.all
	end

	def new
		
	end

	def has_courses?
		return Course.all.count>0
	end
end
