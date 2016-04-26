require 'weather-api'
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

   before_action :admin_user,     only: :destroy
  def show
    response = Weather.lookup(562477, Weather::Units::CELSIUS)


    @forecasts = response.forecasts

  

  	@user = User.find(params[:id])
    @microposts = @user.microposts
  end
  def new
  	@user = User.new
  end
  def create
        secure_params = params.require(:user).permit(:name, :email,
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
          remember @user
        	 flash[:success] = "Welcome to the Twitter App!"
           redirect_to @user# Handle a successful save.
        else
            render 'new'# Handle an unsuccessful save.
        end
  end

  def m_register
    secure_params = {"name" => params[:name], "email" =>params[:email], "password" => params[:password], "password_confirmation" => params[:password_confirmation]}
    @user = User.new(secure_params)
    if @user.save
      remember @user
       render json: @user
    else
        render json: {:statue => false}
    end
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
