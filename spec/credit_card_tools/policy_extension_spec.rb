# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CreditCardTools::PolicyExtension do
  describe '.class_for' do
    let(:object) { Class.new { extend CreditCardTools::PolicyExtension } }
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
end
