# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::TypeRetriever::Policies::VisaPolicy do
  subject { described_class.new({}) }

  describe '.matches?' do
    context 'when credit card number is from Visa' do
      let(:credit_card) { '4111111111111111' }
      it { expect(described_class.matches?(credit_card)).to eq(true) }
    end

    context "when credit card number isn't from Visa" do
      let(:credit_card) { '3111111111111112' }
      it { expect(described_class.matches?(credit_card)).to eq(false) }
    end

    context 'when credit card number is invalid' do
      let(:credit_card) { '4211111111111111' }
      it { expect(described_class.matches?(credit_card)).to eq(false) }
    end
  end
end
