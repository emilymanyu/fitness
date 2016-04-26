class SessionsController < ApplicationController
  def new
  end

  def thirdpart
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    uuser = Uuser.sign_in_from_omniauth(auth)
    session[:uuser_id] = uuser.id

    redirect_to root_url, notice: "Signed In Successfully!"
  end 

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          remember user
          redirect_to user
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
  end

  def m_login
    user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          render json: user
        else
          render json: {:status => false}
        end
  end

  def destroy
        session[:uuser_id]  = nil
        session[:omniauth] = nil

        log_out if logged_in?
        redirect_to root_url
  end
end
