# -*- encoding : utf-8 -*-
require 'credit_card_tools/number_validator/policies'

module CreditCardTools
  # This class is responsible for validating if
  # the number belongs to a valid credit card.
  module NumberValidator
    extend CreditCardTools::PolicyExtension

    def self.valid?(number)
      formatted_number = format_number(number)
      return false if formatted_number.nil? || formatted_number.empty?
      matches? formatted_number
    end

    def self.matches?(number)
      policy_class_names.each do |class_name|
        name = "#{Policies.name}::#{class_name}"
        return true if class_for(name).matches?(number)
      end
      false
    end

    def self.policy_class_names
      Policies.constants
    end
  end
end
