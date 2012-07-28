# == Schema Information
#
# Table name: quote_sources
#
#  id                  :integer          not null, primary key
#  source_url          :string(255)
#  api_url             :text
#  source_name         :string(255)
#  response_type       :string(255)      default("json")
#  quote_reference     :string(255)      not null
#  permalink_reference :string(255)
#  author_reference    :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class QuoteSource < ActiveRecord::Base
  attr_accessible :api_url, :author_reference, :permalink_reference, :quote_reference, :response_type, :source_name, :source_url
end
