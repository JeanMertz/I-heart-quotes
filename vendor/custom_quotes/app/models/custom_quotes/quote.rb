module CustomQuotes
  class Quote < ActiveRecord::Base
    attr_accessible :author, :quote_text, :sourcelink
    validates_presence_of :quote_text
  end
end
