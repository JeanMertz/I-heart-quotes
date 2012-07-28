class QuoteSourcesController < ApplicationController
  # GET /quote_sources
  # GET /quote_sources.json
  def index
    @quote_sources = QuoteSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quote_sources }
    end
  end

  # GET /quote_sources/1
  # GET /quote_sources/1.json
  def show
    @quote_source = QuoteSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote_source }
    end
  end

  # GET /quote_sources/new
  # GET /quote_sources/new.json
  def new
    @quote_source = QuoteSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote_source }
    end
  end

  # GET /quote_sources/1/edit
  def edit
    @quote_source = QuoteSource.find(params[:id])
  end

  # POST /quote_sources
  # POST /quote_sources.json
  def create
    @quote_source = QuoteSource.new(params[:quote_source])

    respond_to do |format|
      if @quote_source.save
        format.html { redirect_to @quote_source, notice: 'Quote source was successfully created.' }
        format.json { render json: @quote_source, status: :created, location: @quote_source }
      else
        format.html { render action: "new" }
        format.json { render json: @quote_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quote_sources/1
  # PUT /quote_sources/1.json
  def update
    @quote_source = QuoteSource.find(params[:id])

    respond_to do |format|
      if @quote_source.update_attributes(params[:quote_source])
        format.html { redirect_to @quote_source, notice: 'Quote source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_sources/1
  # DELETE /quote_sources/1.json
  def destroy
    @quote_source = QuoteSource.find(params[:id])
    @quote_source.destroy

    respond_to do |format|
      format.html { redirect_to quote_sources_url }
      format.json { head :no_content }
    end
  end
end
