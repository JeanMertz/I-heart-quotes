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

class CachedQuote < ActiveRecord::Base
  attr_accessible :hashed_key, :quoted_text, :author, :sourcelink, :quote_source_id

  # Each stored quote is tied to the original quote source. This is currently
  # not used in the application but the little overhead it causes can pay off
  # if we decide to do more with the original sources.
  #
  belongs_to :quote_source

  # Select a random row in the database. Significantly faster than
  # `order('RANDOM()').
  #
  def self.random
    offset(rand(count)).first
  end
end
