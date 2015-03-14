# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::NumberValidator do
  subject { described_class.new({}) }

  describe '.valid?' do
    context 'when the number is nil' do
      it { expect(described_class.valid?(nil)).to eq(false) }
    end

    context 'when the number is empty' do
      it { expect(described_class.valid?('')).to eq(false) }
    end

    context 'when the card number exists' do
      it "calls the '.matches_any_policy?' method" do
        expect(described_class).to receive(:matches?)
        described_class.valid?('123')
      end
    end
  end

  describe '.matches?' do
    it 'looks for all Policy classes' do
      expect(described_class)
        .to(receive(:policy_class_names))
        .and_return([])
      described_class.matches?('123')
    end

    it "calls each Policy 'match' method" do
      expect(CreditCardTools::NumberValidator::Policies::LuhnPolicy)
        .to(receive(:matches?))
      described_class.matches?('123')
    end

    it 'returns true if it matches a Policy' do
      expect(CreditCardTools::NumberValidator::Policies::LuhnPolicy)
        .to(receive(:matches?))
        .and_return(true)
      expect(described_class.matches?('123')).to eq(true)
    end

    it "returns false if it doesn't match any Policy" do
      expect(described_class)
        .to(receive(:policy_class_names))
        .and_return([])
      expect(described_class.matches?('123')).to eq(false)
    end
  end
end
