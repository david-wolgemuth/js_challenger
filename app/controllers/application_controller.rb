class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  # ----- HELPERS
  
  def render_errors(errors, redirect_url: :back)
    render_messages(errors, class_name: :danger, redirect_url: redirect_url) 
  end
  
  def render_messages(messages, class_name: :success, redirect_url: :back)
    puts "TYPE: #{class_name.inspect}"
    puts "MESSAGES: #{messages.inspect}"
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
    if request.referer
      redirect_to request.referer, options
    else
      redirect_to root_path, options
    end
  end
  
  helper_method :render_errors, :render_messages, :redirect_back
  
end
