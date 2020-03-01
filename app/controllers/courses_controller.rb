class CoursesController < ApplicationController
	#Ignore default action from application controller
	skip_before_action :require_user

	helper_method :has_courses?

	def index
		if has_courses?
			@courses = Course.all
		end
	end

	def new
		
	end

	def has_courses?
		return Course.all.count>0
	end
end
