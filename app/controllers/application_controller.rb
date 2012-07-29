class ApplicationController < ActionController::Base
  protect_from_forgery

  # Set the weight of the cached quotes. This number represents `i` in the
  # following formula to determine if a cached quote should be shown:
  #
  #    rand(100).between?(100-i, 100)
  #
  # Setting a higher value significantly recudes page load times because the
  # service can poll the local database instead of an external API.
  #
  # A higher number will slow down the growth of the database as less new
  # quotes are gathered and stored locally.
  #
  # Recommended values:
  #  | cached quotes | cache_weight |
  #  +---------------+--------------+
  #  | 0 - 100       | 1            | rapid database growth
  #  | 101 - 500     | 25           |
  #  | 501 - 1000    | 50           |
  #  | 1000+         | 90           | almost no new records saved
  #
  def cache_weight
    KueStore[:cache_weight].to_i
  end
  helper_method :cache_weight
end
