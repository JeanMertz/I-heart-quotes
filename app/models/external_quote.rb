# == Schema Information
#
# Table name: cached_quotes
#
#  id              :integer          not null, primary key
#  hashed_key      :string(255)
#  quoted_text     :text             not null
#  author          :string(255)
#  sourcelink      :string(255)
#  quote_source_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ExternalQuote < CachedQuote
  after_initialize :get_random_quote

  def get_random_quote
    # Get external quote if a quote source is available
    if source = QuoteSource.random
      data = get_data_from_source(source)
      data = normalize_data(data, source)
      set_instance_variables(data, source)
    end
  end

  private

  # Hit the external API and parse the data back into the application.
  #
  def get_data_from_source(source)
    url = URI.parse(source.api_url)

    if url.respond_to?(:request_uri)
      Net::HTTP.get_response(url).body
    end
  end

  def normalize_data(data, source)
    # Case statement to determine how to handle the incoming data. Right now
    # JSON and XML work. In the future more could be easily added, like a txt
    # parser or a HTML scraper.
    #
    case source.response_type
    when 'xml'  then QuoteParser.xml(data)
    when 'json' then QuoteParser.json(data)
    end
  end

  def set_instance_variables(data, source)
    # TODO: Tidy up this code by renaming the database columns in
    # `quote_sources` to match those in `cached_quotes`.
    #
    if data && data[source.quote_reference]
      self.quoted_text      = data[source.quote_reference]
      self.author           = data[source.author_reference]     || ''
      self.sourcelink       = data[source.permalink_reference]  || ''
      self.quote_source_id  = source.id
    end
  end
end
