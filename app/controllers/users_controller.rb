class UsersController < ApplicationController

  def new
  end
  
  def create
    user = User.create(user_create_params)
    if user.errors.any?
      return render_errors(errors.full_messages)
    end
    session[:user_id] = user.id
    return render_messages('Successfully Created User', redirect_url: '/')
  end
  
private #----------------------
  
  def user_create_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
