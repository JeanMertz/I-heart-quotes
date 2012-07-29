require 'spec_helper'

describe ExternalQuote do

  describe '.get_random_quote' do
    it { should respond_to(:get_random_quote) }

    context 'no external source available' do
      it { should be_a(ExternalQuote) }
      it { subject.quoted_text.should be_nil }
    end

    context 'invalid external data' do
      let!(:external_source) { FactoryGirl.create(:quote_source, api_url: 'invalid') }
      it { should be_a(ExternalQuote) }
      it { subject.quoted_text.should be_nil }
    end

    context 'with external source', :vcr do
      let!(:external_source) { FactoryGirl.create(:quote_source) }
      it { should be_a(ExternalQuote) }
      it { subject.quoted_text.should_not be_nil }
    end
  end

end
