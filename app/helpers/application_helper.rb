module ApplicationHelper
  def current_user
    @user = session[:username]
    if @user.empty?
      redirect_to root_path
    else
      return @user
    end
  end
end
