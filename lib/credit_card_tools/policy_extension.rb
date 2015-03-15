# -*- encoding : utf-8 -*-
module CreditCardTools
  # An extension containing methods to deal with Policies
  module PolicyExtension
    def policy_class_names
      Policies.constants
    end

    def class_for(name)
      Object.const_get(name)
    end

    def format_number(number)
      return '' unless number.is_a?(String)
      number.gsub(' ', '').gsub('-', '')
    end
  end
end
