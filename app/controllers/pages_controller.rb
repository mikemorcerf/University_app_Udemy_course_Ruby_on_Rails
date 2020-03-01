class PagesController < ApplicationController
	#Ignore default action from application controller
	skip_before_action :require_user

  def about
  end
end
