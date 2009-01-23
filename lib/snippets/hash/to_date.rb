#==============================================================================
# Hash to_date - from qualitysmith_extensions gem
#==============================================================================
class Hash
  # Converts a <tt>{:year => ..., :month => ..., :day => ...}</tt> hash into an actual Date object.
  # Useful for when you have a date element in your <tt>params</tt> hash.
  def to_date
    Date.new(fetch(:year).to_i, fetch(:month).to_i, fetch(:day).to_i)
  end
end