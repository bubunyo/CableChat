module ApplicationHelper
  def current_user
    @user = session[:username]
    if @user.nil?
      ''
    else
      @user
    end
  end
end
