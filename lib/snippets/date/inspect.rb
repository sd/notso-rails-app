#==============================================================================
# Date inspect - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# The official Date object doesn't have an inspect method

class Date
  def inspect
    self.strftime("%Y-%m-%d %a")
  end
end
