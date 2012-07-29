require 'spec_helper'

describe QuoteSource do

  describe '.random' do
    it { QuoteSource.should respond_to(:random) }

    it "returns a random QuoteSource object" do
      # create two records to verfiy they get returned
      # quotes = FactoryGirl.create_list(:quote_source, 2)

      # How to test this method? I can't stub out rand() because it uses the
      # built-in SQL function RANDOM(), and I really don't want to depend on
      # the scale of large numbers to minimize spec failure as there will
      # always be failures when you least expect it.
      #
      # Let's leave this one for now.

    end
  end
end
