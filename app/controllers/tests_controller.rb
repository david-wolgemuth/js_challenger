class TestsController < ApplicationController
  before_action :get_challenge_from_params, only: [:index, :create]

  def some_method
    items = Item.all
    render json: items
  end

  def index
    @tests = @challenge.tests
  end

  def create
    @challenge.tests.create(test_io_params)
    render_messages('Successfully Created Test Case')
  end

  def edit
    
  end

private
  
  def get_challenge_from_params
    @challenge = Challenge.find(params[:challenge_id])
  end

  def test_io_params
    inputs = "{\n" + params[:inputs].zip(@challenge.params_array).map do |value, input|
      # Create JSON string from inputs
      puts input
      puts value
      '"' + input[:name] + '": ' +  # "key":
      '"' + value + '"'             # "value"
    end.join(",\n") + "}"
    {
      inputs: inputs,
      return_value: params[:return_value]
    }
  end

end
