class QuotesController < ApplicationController

  def random
    if show_cached_quote?
      @quote = CachedQuote.random
    else
      @quote = CachedQuote.store_cache(ExternalQuote.new)
    end

    render :show
  end

  # Weight based calculation to determine frequency of cached quotes.
  #
  def show_cached_quote?
    rand(100).between?(100 - cache_weight, 100)
  end
end
