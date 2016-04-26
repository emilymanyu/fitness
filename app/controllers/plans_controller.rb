class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]


  def index
    @plans = Plan.all
  end

  def show
      @plan = Plan.find(params[:id])
  end


  def new
    @plan = Plan.new
  end


  def edit
  end


  def create
    @plan = Plan.new(plan_params)

    @plan.user_id=current_user.id
      if @plan.save
        redirect_to @plan, notice: 'Plan was successfully created.'

      else
        render :new


    end
  end


  def update

      if @plan.update(plan_params)
      redirect_to @plan, notice: 'Plan was successfully updated.'

      else
       render :edit

    end
  end


  def destroy
    @plan.destroy

       redirect_to plans_url, notice: 'Plan was successfully destroyed.'


  end

  private

    def set_plan
      @plan = Plan.find(params[:id])
    end


    def plan_params
      params.require(:plan).permit(:strat_time, :end_time, :distance, :progress, :state,:user_id)
    end
end
