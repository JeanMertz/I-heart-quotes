require 'spec_helper'

describe CachedQuote do

  describe '.random' do
    it { CachedQuote.should respond_to(:random) }

    it "returns a random CachedQuote object" do
      # create two records to verfiy they get returned
      quotes = FactoryGirl.create_list(:cached_quote, 2)

      # stub rand so we know the returned value
      CachedQuote.stub(:rand).and_return(0)
      CachedQuote.random.should eql(quotes[0])

      CachedQuote.stub(:rand).and_return(1)
      CachedQuote.random.should eql(quotes[1])
    end
  end

  describe ".store_cache" do
    let!(:external) { FactoryGirl.build(:external_quote) }
    subject { lambda { |quote| CachedQuote.store_cache(quote) } }

    it { CachedQuote.should respond_to(:store_cache) }

    context 'quote already cached' do
      let!(:cached_quote) { FactoryGirl.create(:cached_quote, quoted_text: external.quoted_text, author: external.author) }
      it { subject.call(external).should eql(cached_quote) }
    end

    context 'new quote should be added to database' do
      let!(:cached_quote) { FactoryGirl.create(:cached_quote) }
      it { subject.call(external).should_not eql(cached_quote) }
      it { subject.call(external).should be_a(CachedQuote) }
      it { subject.call(external).quoted_text.should eql(external.quoted_text) }
    end
  end
end
