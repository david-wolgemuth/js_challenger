class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # ----- HELPERS
  
  def logged_in_user
    if @logged_in_user.nil?
      @logged_in_user = User.find(session[:user_id]) 
    end
    @logged_in_user
  end
  
  def render_errors(errors, redirect_url: :back)
    render_messages(errors, class_name: :danger, redirect_url: redirect_url) 
  end
  
  def render_messages(messages, class_name: :success, redirect_url: :back)
    flash[class_name] ||= []
    if messages.kind_of?(Array)
      flash[class_name] += messages
    else
      flash[class_name] += [messages]
    end
    if redirect_url.nil?
      return
    elsif redirect_url == :back
      redirect_back
    else
      redirect_to redirect_url
    end
  end
  
  def redirect_back(options = {})
    # https://stackoverflow.com/questions/6118089/redirecting-back-doesnt-work-anymore
    if request.referer
      redirect_to request.referer, options
    else
      redirect_to root_path, options
    end
  end
  
  helper_method :render_errors, :render_messages, :redirect_back
  
end
