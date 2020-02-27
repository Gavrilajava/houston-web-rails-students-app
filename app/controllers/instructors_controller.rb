class InstructorsController < ApplicationController

  before_action :current_instance, only: [:show, :edit, :update, :destroy]

  def index
    @instances = Instructor.all
  end

  def show
  
  end

  def new
    @instance = Instructor.new
  end

  def create
    @instance = Instructor.new(strong_params)
    if @instance.valid?
      @instance.save
      redirect_to instructor_path(@instance)
    else 
      flash[:errors] =  @instance.errors.full_messages
      redirect_to new_instructor_path
    end
  end

  def edit
  end

  def update
    @instance = Instructor.new(strong_params)
    if @instance.valid?
      @instance.save
      redirect_to instructor_path(@instance)
    else 
      flash[:errors] =  @instance.errors.full_messages
      redirect_to new_instructor_path
    end
  end

  def destroy
    @instance.destroy
    redirect_to instructors_path
  end

  private

  def current_instance
    @instance = Instructor.find(params[:id])
  end

  def strong_params
    params.require(:instructor).permit(:name)
  end

end
