#==============================================================================
# Object assertions - by Sebastian Delmont <sd@notso.net>
#==============================================================================

class Object
  # I'm just tired of writting "not object.blank?"
  def not_blank?
    not blank?
  end
end
