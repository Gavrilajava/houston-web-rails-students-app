class StudentsController < ApplicationController



    before_action :current_instance, only: [:show, :edit, :update, :destroy]
  
    def index
      @instances = Student.all
    end
  
    def show
    
    end
  
    def new
      @instance = Student.new
      @instructors = Instructor.all
    end
  
    def create
      @instance = Student.new(strong_params)
      if @instance.valid?
        @instance.save
        redirect_to student_path(@instance)
      else 
        flash[:errors] =  @instance.errors.full_messages
        redirect_to new_student_path
      end
    end
  
    def edit
      @instructors = Instructor.all
    end
  
    def update
      @instance.update(strong_params)
      if @instance.valid?
        @instance.save
        redirect_to student_path(@instance)
      else 
        flash[:errors] =  @instance.errors.full_messages
        redirect_to edit_student_path(@instance)
      end
    end
  
    def destroy
      @instance.destroy
      redirect_to students_path
    end
  
    private
  
    def current_instance
      @instance = Student.find(params[:id])
    end
  
    def strong_params
      params.require(:student).permit(:name, :major, :age, :instructor_id)
    end
  

  
end
