require_dependency "custom_quotes/application_controller"

module CustomQuotes
  class QuotesController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'admin',
      except: [:random, :show]

    def random
      # Get random quote from database.
      #
      @quote = Quote.offset(rand(Quote.count)).first

      # Convert quote to a sliced hash with only the allowed elements.
      #
      quote = @quote.attributes.symbolize_keys!.slice(:author, :quote_text)

      # Add the sourcelink to the hash and render the result.
      #
      render json: quote.merge({sourcelink: quote_url(@quote.id)})
    end

    def index
      @quotes = Quote.all
    end

    def show
      @quote = Quote.find(params[:id])
    end

    def new
      @quote = Quote.new
    end

    def edit
      @quote = Quote.find(params[:id])
    end

    def create
      @quote = Quote.new(params[:quote])

      if @quote.save
        redirect_to quotes_url, notice: 'Quote was successfully created.'
      else
        render action: "new"
      end
    end

    def update
      @quote = Quote.find(params[:id])

      if @quote.update_attributes(params[:quote])
        redirect_to quotes_url, notice: 'Quote was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @quote = Quote.find(params[:id])
      @quote.destroy

      redirect_to quotes_url
    end
  end
end
