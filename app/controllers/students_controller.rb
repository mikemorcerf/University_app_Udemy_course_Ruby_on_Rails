class StudentsController < ApplicationController
	#Get student
	before_action :set_student, only: [:show, :edit, :update]

	#Only allow logged in students to edit and update their profile
	before_action :require_same_student, only: [:edit, :update]

	#Ignore default action from application controller
	skip_before_action :require_user, only: [:create, :new]



  def index
  	@students = Student.all
  end

  def new
  	@student = Student.new
  end

  def edit

  end

  def show

  end

  def create
  	@student = Student.new(student_params)
  	if @student.save
  		flash[:notice] = "You have successfully signed up"
  		redirect_to @student
  	else
  		render 'new'
  	end
  end

  def update
  	if @student.update(student_params)
  		flash[:notice] = "You have successfully updated your profile"
  		redirect_to student_path(@student)
  	else
  		render 'edit'
  	end
  end


  private
  #Security check
  def student_params
  	params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
  	@student = Student.find(params[:id])
  end

  def require_same_student
  	if current_user != @student
  		flash[:notice] = "You can only edit your own profile"
  		redirect_to student_path(current_user)
  	end
  end
end
