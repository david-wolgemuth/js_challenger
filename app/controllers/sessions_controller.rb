class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.authenticate(params)
    if user.present?
      render_messages("Welcome #{user.username}!")
    else
      render_errors("Bad Login Credentials.")
    end
  end
  
end
