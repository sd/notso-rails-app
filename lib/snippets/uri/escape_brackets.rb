#==============================================================================
# URI escape brackets - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# The default URI.escape doesn't escape brackets ( [ and ] ) for some reason.
# But URI.merge complains about those characters.
# So until uri.rb makes up its mind, we're going to escape them

require 'uri'

module URI
  module REGEXP
    module PATTERN
      RESERVED_MINUS_BRACKETS = ";/?:@&=+$,"
    end

    remove_const "UNSAFE"
  
    UNSAFE  = Regexp.new("[^#{PATTERN::UNRESERVED}#{PATTERN::RESERVED_MINUS_BRACKETS}]",
                           false, 'N').freeze
  end
end