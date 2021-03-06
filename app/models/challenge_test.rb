class ChallengeTest < ApplicationRecord
  belongs_to :challenge

  def inputs_hash
    JSON.parse(inputs, symbolize_names: true)
  end

  def args_string
    inputs_hash.map{ |key, value| value.inspect }.join(', ')
  end

  def return_json
    JSON.parse(return_value)
  end

  def io_hash
    output = inputs_hash
    output[:return] = return_value
    output
  end

end
