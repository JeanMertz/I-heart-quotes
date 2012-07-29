class QuotesController < ApplicationController

  def random
    if show_cached_quote?
      @quote = CachedQuote.random
    else
      @quote = CachedQuote.store_cache(ExternalQuote.new)
    end

    render :show
  end

  # Show action is used to provide permalink functionality. Most polled quote
  # services also provide a permalink, this link is shown as the "source" url.
  #
  def show
    @quote = CachedQuote.find(params[:id])
  end

  private

  # Weight based calculation to determine frequency of cached quotes.
  #
  def show_cached_quote?
    rand(100).between?(100 - cache_weight, 100)
  end
end
