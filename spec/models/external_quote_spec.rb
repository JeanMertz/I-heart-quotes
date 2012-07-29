require 'spec_helper'

describe ExternalQuote do

  describe '.get_random_quote' do
    it { should respond_to(:get_random_quote) }

    context 'no external source available' do

      context 'cached quote available' do
        let!(:cached_quote) { FactoryGirl.create(:cached_quote) }
        it { should be_a(ExternalQuote) }
        it { subject.quoted_text.should eql(cached_quote.quoted_text) }
      end

      context 'cached quote database empty' do
        it { should be_a(ExternalQuote) }
        it { subject.quoted_text.should be_nil }
      end
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
