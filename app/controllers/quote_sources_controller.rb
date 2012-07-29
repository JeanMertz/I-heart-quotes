class QuoteSourcesController < ApplicationController
  # Basic authentication will do for now. Please excuse the plain password
  # inside the source code ;-)
  #
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @quote_sources = QuoteSource.order('weight DESC')
  end

  def new
    @quote_source = QuoteSource.new
  end

  def edit
    @quote_source = QuoteSource.find(params[:id])
  end

  def create
    @quote_source = QuoteSource.new(params[:quote_source])

    if @quote_source.save
      redirect_to quote_sources_url, notice: 'Quote source was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @quote_source = QuoteSource.find(params[:id])

    if @quote_source.update_attributes(params[:quote_source])
      redirect_to quote_sources_url, notice: 'Quote source was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @quote_source = QuoteSource.find(params[:id])
    @quote_source.destroy

    redirect_to quote_sources_url
  end
end
