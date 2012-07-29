class QuotesController < ApplicationController

  def random
    # First we check if a cached quote should be served, if not, we get an
    # external quote.
    #
    unless show_cached_quote?
      @quote = CachedQuote.store_cache(ExternalQuote.new)
    end

    # After that, if no external quote is supplied – either because no external
    # sources are provided or `show_cached_quote?` returned true – we get a
    # local quote from the database.
    #
    @quote = CachedQuote.random unless @quote

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
