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

  def self.store_cache(ext)
    # Take requested object attributes and put them in a hash
    #
    attr = ext.attributes.symbolize_keys!.slice(:quoted_text, :author, :sourcelink, :quote_source_id)

    # Verify the required data is available or else return nil
    #
    return unless attr[:quoted_text] && attr[:quote_source_id]

    # Generate a hash based on the quote and the author of the quote (if any).
    # The hash is stored in the database as a UNIQ INDEX key, to speed up
    # future requests.
    #
    # Both quote and author used because, well, by human nature, we like to
    # call things our own, so chances of two people having the exact same
    # quote attached to their name is rather large ;-)
    #
    attr[:hashed_key] = Digest::SHA1.hexdigest(attr[:quoted_text] + attr[:author])

    # Store or retrieve if the hash already exists.
    #
    where(hashed_key: attr[:hashed_key]).first_or_create!(attr)
  end
end
