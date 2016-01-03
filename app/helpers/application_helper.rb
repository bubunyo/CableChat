module ApplicationHelper
  def current_user
    user = session[:username]
    if user.nil?
      ''
    else
      user
    end
  end
  def hex
    hex = session[:hex]
    if hex.nil?
      ''
    else
      hex
    end
  end
end
