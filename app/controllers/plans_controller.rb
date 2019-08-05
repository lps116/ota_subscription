class PlansController < ApplicationController
  def new
    @plan = Plan.new
    @user = User.find(params[:user_id])
  end

  def create
    @plan = Plan.new(strong_params)
    @user = User.find(params[:user_id])
    @plan.user = @user
    if @plan.save
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to user_path(params[:user_id])
  end

  def show
    @plan = Plan.find(params[:id])
  end

  private

  def strong_params
    params.require(:plan).permit(:name, :duration, :price_cents)
  end

end
