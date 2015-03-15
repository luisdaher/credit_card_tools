# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::PolicyExtension do
  let(:object) { Class.new { extend CreditCardTools::PolicyExtension } }

  describe '.class_for' do
    it { expect(object.class_for('String')).to eq(String) }
    it { expect { object.class_for('FooBar') }.to raise_error }
  end

  describe '.policy_class_names' do
    let(:object) { CreditCardTools::TypeRetriever }

    it "returns all the classes names inside the module's Policies namespace" do
      expect(CreditCardTools::TypeRetriever::Policies).to(
        receive(:constants).and_return([:foo, :bar])
      )
      expect(object.policy_class_names).to eq([:foo, :bar])
    end
  end

  describe '.format_number' do
    context 'when it receives values other than String' do
      it { expect(object.format_number(nil)).to eq('') }
      it { expect(object.format_number(123)).to eq('') }
    end

    context 'when the value is a String' do
      context 'and it contains spaces' do
        it { expect(object.format_number('1234 1244')).to eq('12341244') }
      end

      context 'and it contain dashes' do
        it { expect(object.format_number('1234-1244')).to eq('12341244') }
      end

      context "but it doesn't contain spaces or dashes" do
        it { expect(object.format_number('12341244')).to eq('12341244') }
      end
    end
  end
end
