# == Schema Information
#
# Table name: quote_sources
#
#  id                  :integer          not null, primary key
#  source_url          :string(255)
#  api_url             :text             not null
#  source_name         :string(255)
#  response_type       :string(255)      default("json")
#  quote_reference     :string(255)      not null
#  permalink_reference :string(255)
#  author_reference    :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class QuoteSource < ActiveRecord::Base
  # `*_references` are used to tie external naming to the correct database names.
  # For example, ilovequotes.com uses the term `source` where we use `author`.
  #
  # `api_url` is the full url to poll an API whereas `source_url` is used to
  # provide the correct backlinks as a thank you for their service.
  #
  attr_accessible :api_url, :author_reference, :permalink_reference,
    :quote_reference, :response_type, :source_name, :source_url, :weight

  has_many :cached_quotes


  # Select a random row in the database. A lot slower than
  # `offset(rand(count)).first`, but it needs to support a weight based value.
  #
  def self.random
    order('RANDOM()*weight DESC').first
  end
end
