# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::NumberValidator::Policies::HipercardPolicy do
  subject { described_class.new({}) }

  describe '.matches?' do
    context 'when credit card number has an allowed size' do
      let(:credit_card_big)   { '1234123412341234123' }
      let(:credit_card_small) { '1234123412341' }
      it { expect(described_class.matches?(credit_card_big)).to eq(true) }
      it { expect(described_class.matches?(credit_card_small)).to eq(true) }
    end

    context "when credit card number doesn't have an allowed size" do
      let(:credit_card) { '4111111111111112' }
      it { expect(described_class.matches?(credit_card)).to eq(false) }
    end
  end
end
