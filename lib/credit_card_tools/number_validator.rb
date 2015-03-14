# -*- encoding : utf-8 -*-
module CreditCardTools
  # This class is responsible for validating if
  # the number belongs to a valid credit card.
  module NumberValidator
    def self.valid?(number)
      number && matches_all_policies?(number)
    end

    def self.matches_all_policies?(number)
      Policies.constants.inject(false) do |result, class_name|
        name = 'CreditCardTools::NumberValidator::Policies::'
        name += class_name.to_s
        result || Object.const_get(name).matches?(number)
      end
    end
  end
end
