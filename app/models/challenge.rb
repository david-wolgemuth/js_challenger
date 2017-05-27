class Challenge < ApplicationRecord
  attr_accessor :parameter_names, :parameter_types
  before_save :join_parameter_names_and_types!
  
  
  
  
  def join_parameter_names_and_types!
    if parameter_names.nil? || parameter_types.nil?
      return
    end
    self.parameters = parameter_names.each_with_index.map do |name, index|
      "#{name.strip}:#{parameter_types[index].strip}"
    end
  end
  
end
