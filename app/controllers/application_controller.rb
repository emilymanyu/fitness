class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  include SessionsHelper

  def current_uuser
  	@current_uuser ||= Uuser.find(session[:uuser_id]) if session[:uuser_id]
  end

  helper_method :current_uuser
end
