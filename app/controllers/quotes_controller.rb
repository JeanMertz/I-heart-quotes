class QuotesController < ApplicationController
  def random
    render text: 'this is a static quote'
  end
end
