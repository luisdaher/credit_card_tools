# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::NumberValidator::Policies::LuhnPolicy do
  subject { described_class.new({}) }

  describe '.matches?' do
    context 'when credit card number is valid' do
      let(:credit_card) { '4111111111111111' }
      it { expect(described_class.matches?(credit_card)).to eq(true) }
    end

    context 'when credit card number is invalid' do
      let(:credit_card) { '4111111111111112' }
      it { expect(described_class.matches?(credit_card)).to eq(false) }
    end
  end
end
