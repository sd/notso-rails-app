#==============================================================================
# Nil assertions - by Sebastian Delmont <sd@notso.net>
#==============================================================================

class NilClass
  def any?; false; end
  def successful?; false; end
end
