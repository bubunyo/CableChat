class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :cors_preflight_check

  private
  def set_user(username, hex_class)
    session[:username] = username
    session[:hex] = hex_class
  end

  def user_name_set
    if session[:username].nil?
      redirect_to root_path
    end
  end

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = 'https://action-cable.herokuapp.com'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
