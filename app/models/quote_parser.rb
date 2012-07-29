class QuoteParser
  def self.xml(data)
    self.json(Hash.from_xml(data).to_json)
  end

  def self.json(data)
    # set `#create_id` to nil to work around the forced `json_class` setting.
    # This is an external restriction set on our internal application, shoo!
    #
    JSON.create_id = nil
    ActiveSupport::JSON.decode(data)
  rescue
  end
end
