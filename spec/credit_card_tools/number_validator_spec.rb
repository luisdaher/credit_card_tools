# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::NumberValidator do
  subject { described_class.new({}) }

  describe ".valid?" do
    context "when credit card number is valid" do
      context "and it is a common credit card" do
        let(:credit_card) { '4111111111111111' }
        it{ expect(described_class.valid?(credit_card)).to eq(true) }
      end

      context "and it is a Hipercard credit card" do
        let(:credit_card) { '1234123412341234123' }
        it{ expect(described_class.valid?(credit_card)).to eq(true) }
      end

      context "and it is an AMEX credit card" do
        let(:credit_card) { '378282246310005' }
        it{ expect(described_class.valid?(credit_card)).to eq(true) }
      end

    end

    context "when credit card number is invalid" do
      context "and it is a common credit card" do
        let(:credit_card) { '4111111111111112' }
        it{ expect(described_class.valid?(credit_card)).to eq(false) }
      end

      context "and it is an AMEX credit card" do
        let(:credit_card) { '378282246310006' }
        it{ expect(described_class.valid?(credit_card)).to eq(false) }
      end
    end

  end

end