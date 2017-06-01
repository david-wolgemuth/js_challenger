class ChallengesController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def index
    @challenges = Challenge.all
  end

  def new
  end

  def create
    challenge = logged_in_user.challenges.create(challenge_params)
    render json:challenge
  end

  def show
  end
  
private # --------------------

  def challenge_params
    params.require(:challenge).permit(
      :title,
      :description,
      :function_name,
      :parameter_names => [],
      :parameter_types => []
    )
  end
  
end
