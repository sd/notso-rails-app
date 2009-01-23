#==============================================================================
# Nil comparisons - by Sebastian Delmont <sd@notso.net>
#==============================================================================
class NilClass
  def <(a); false; end
  def >(a); false; end
  def <=(a); false; end
  def >=(a); false; end
end
