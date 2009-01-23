#==============================================================================
# String obfuscate - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# String obfuscation, not strong enough for security, but can protect your
# passwords from someone looking over your shoulder.

class String
  def obfuscate(key = 1337)
    Base64.encode64(self.unpack("C*").map{ |e| key += 1; e += key }.pack("s*"))[0..-2]  # base64 adds an extra \n we don't need
  end
  
  def clarify(key = 1337)
    Base64.decode64(self).unpack("s*").map{ |e| key += 1; e -= key }.pack("C*")
  end
end
