class Challenge < ApplicationRecord
  attr_accessor :param_names, :param_types
  before_save :join_param_names_and_types!
  
  belongs_to :user
  has_many :tests, class_name: 'ChallengeTest'
  
  def test_string test
    "#{function_name}(#{test.args_string}): #{test.return_value}"
  end

  def params_array
    JSON.load(parameters).map do |param|
      {
        name:param.split(':')[0],
        type:param.split(':')[1]
      }
    end
  end
  
  def join_param_names_and_types!
    if param_names.nil? || param_types.nil?
      return
    end
    self.parameters = param_names.each_with_index.map do |name, index|
      "#{name.strip}:#{param_types[index].strip}"
    end
  end
  
end
