# -*- encoding : utf-8 -*-
require 'credit_card_tools/type_retriever/policies'

module CreditCardTools
  # This class is responsible for retrieving the credit card type (if possible)
  module TypeRetriever
    extend CreditCardTools::PolicyExtension

    def self.retrieve(number)
      return nil if number.nil? || number.empty?
      type_for number
    end

    def self.type_for(number)
      policy_class_names.each do |class_symbol|
        name = "#{Policies.name}::#{class_symbol}"
        return symbol_to_type(class_symbol) if class_for(name).matches?(number)
      end
      nil
    end

    def self.policy_class_names
      Policies.constants
    end

    def self.symbol_to_type(symbol)
      symbol.to_s.gsub(/(.)([A-Z])/, '\1 \2').gsub('Policy', '').strip
    end
  end
end
