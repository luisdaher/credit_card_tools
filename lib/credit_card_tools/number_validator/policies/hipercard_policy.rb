# -*- encoding : utf-8 -*-
module CreditCardTools
  module NumberValidator
    module Policies
      # Checks if the number is compliant with the Hipercard rules.
      class HipercardPolicy
        def self.matches?(number)
          [13, 19].include? number.length
        end
      end
    end
  end
end
