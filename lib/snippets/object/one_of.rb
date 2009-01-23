#==============================================================================
# Object one_of - by Sebastian Delmont <sd@notso.net>
#==============================================================================
class Object
  # Makes sure the value is "one of" the list given, otherwise returns the first value from the list
  def one_of(*args)
    args = args.flatten
    
    (args.include?(self) && self) || args[0]
  end
  
end