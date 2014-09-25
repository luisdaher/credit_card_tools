# -*- encoding : utf-8 -*-
module CreditCardTools
  class NumberValidator
    def self.valid? number
      return number && (hipercard_compliant?(number) || luhn_compliant?(number))
    end

    private
    def self.hipercard_compliant? number
      [13,19].include? number.length
    end

    def self.luhn_compliant? number
      number = number.to_s.gsub(/\D/, "")
      number.reverse!

      relative_number = {'0' => 0, '1' => 2, '2' => 4, '3' => 6, '4' => 8, '5' => 1, '6' => 3, '7' => 5, '8' => 7, '9' => 9}

      sum = 0 

      number.chars.each_with_index do |n, i|
        sum += (i % 2 == 0) ? n.to_i : relative_number[n]
      end 

      sum % 10 == 0
    end
  end
end