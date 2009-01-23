#==============================================================================
# Hash intersection - by Sebastian Delmont <sd@notso.net>
#==============================================================================

class Hash
  def remove_keys_except(keys)
    result = {}
    self.each {|key, value| result[key] = value if keys.include? key}
    result
  end

  alias_method :&, :remove_keys_except
  alias_method :intersect, :remove_keys_except
end
