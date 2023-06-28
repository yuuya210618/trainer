class CaloriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]

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
    @calory= Calory.new(calory_parameter)
    if @calory.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @calory = Calory.find(params[:id])
    @calory.destroy
    redirect_to root_path
  end

  def edit
    @calory = Calory.find(params[:id])
  end

  def update
    @calory = Calory.find(params[:id])
    if @calory.update(calory_parameter)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def calory_parameter
    params.require(:calory).permit(:calories_intake, :start_time).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

