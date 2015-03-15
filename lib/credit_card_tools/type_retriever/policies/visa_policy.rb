# -*- encoding : utf-8 -*-
module CreditCardTools
  module TypeRetriever
    module Policies
      # Checks if the number belongs to Visa.
      class VisaPolicy
        def self.matches?(number)
          response = (/^4\d{15}$/i =~ number)
          return false if response.nil?
          true
        end
      end
    end
  end
end
