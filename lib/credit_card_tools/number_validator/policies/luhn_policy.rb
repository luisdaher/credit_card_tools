# -*- encoding : utf-8 -*-
module CreditCardTools
  module NumberValidator
    module Policies
      # Checks if the number is compliant with the Luhn algorithm.
      class LuhnPolicy
        RELATIVE_NUMBERS = {
          '0' => 0,
          '1' => 2,
          '2' => 4,
          '3' => 6,
          '4' => 8,
          '5' => 1,
          '6' => 3,
          '7' => 5,
          '8' => 7,
          '9' => 9
        }

        def self.matches?(number)
          number = number.to_s.gsub(/\D/, '')
          number.reverse!

          sum = 0

          number.chars.each_with_index do |n, i|
            sum += i.even? ? n.to_i : RELATIVE_NUMBERS[n]
          end
          sum % 10 == 0
        end
      end
    end
  end
end
