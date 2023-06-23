class CaloriesController < ApplicationController

  def index
    @calories = Calory.all
    @calory = Calory.new
  end
  
  def new
    @calory = Calory.new
  end

  def show
    @calory = Calory.find(params[:id])
  end

  def create
    Calory.create(calory_parameter)
    redirect_to calories_path
  end

  def destroy
    @calory = Calory.find(params[:id])
    @calory.destroy
    redirect_to calories_path
  end

  def edit
    @calory = Calory.find(params[:id])
  end

  def update
    @calory = Calory.find(params[:id])
    if @calory.update(calory_parameter)
      redirect_to calories_path
    else
      render 'edit'
    end
  end

  private

  def calory_parameter
    params.require(:calory).permit(:calories_intake).merge(user_id: current_user.id)
  end

end
