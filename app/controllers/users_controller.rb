class UsersController < ApplicationController

  def new
  end
  
  def create
    errors = User.create(user_create_params).errors
    if errors.any?
      return render_errors(errors.full_messages)
    end
    return render_messages('Successfully Created User', redirect_url: '/')
  end
  
private #----------------------
  
  def user_create_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
