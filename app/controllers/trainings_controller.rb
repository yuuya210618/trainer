class TrainingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @trainings = Training.all
    @training = Training.new
    @calories = Calory.all
  end
  
  def new
    @training = Training.new
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_parameter)
    if @training.save
      redirect_to root_path
    else
      render:new
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path, notice:"削除しました"
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(training_parameter)
      redirect_to trainings_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def training_parameter
    params.require(:training).permit(:training_name, :weight, :number, :start_time).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
  
