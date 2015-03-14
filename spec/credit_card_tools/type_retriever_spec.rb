# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::TypeRetriever do
  subject { described_class.new({}) }

  context '.retrieve' do
    context 'when the number is nil' do
      it { expect(described_class.retrieve(nil)).to be_nil }
    end

    context 'when the number is empty' do
      it { expect(described_class.retrieve('')).to be_nil }
    end

    context "when it's a non-empty value" do
      it "calls the 'type_for' method" do
        expect(described_class).to receive(:type_for)
        described_class.retrieve('123')
      end
    end
  end

  context '.type_for' do
    context "when there's no match" do
      it 'returns a nil value' do
        expect(described_class.type_for(nil)).to be_nil
      end
    end

    context 'when it matches a type' do
      it { expect(described_class.type_for('4123111111111111')).to eq('Visa') }
    end
  end
end
