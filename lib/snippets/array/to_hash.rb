#==============================================================================
# Array to_hash - by Sebastian Delmont <sd@notso.net>
#==============================================================================
class Array
  def to_hash
    self.inject({}) do |hash, value| 
      begin 
        hash[value.first] = value.last
        hash
      rescue 
        hash[value] = value
        hash
      end
    end
  end
end
