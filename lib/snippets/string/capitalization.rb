#==============================================================================
# String capitalization - by Sebastian Delmont <sd@notso.net>
#   * based on http://snippets.dzone.com/posts/show/557
#==============================================================================

class String
  TITLECASE_WORD_REGEXP = %r{[\w\'\-]+}
  TITLECASE_ALL_LOWER = %r{^(of|etc|and|by|the|for|on|is|at|to|but|nor|or|a|via|\d+st|\d+nd|\d+rd|\d+th|\d+\'{0,1}s)$}
  TITLECASE_ALL_CAPS = %r{^(ny|nyc|\#{0,1}\d+.*|i+|iv|x+|cpw|cps|uws|ues|bpc|dumbo|ps|ps\d+|hs|hs\d+|is\d+|llc|llp|un)$}  # Words to be upcased have to be listed in lowercase, weird, I know

  NAMECASE_WORD_REGEXP = %r{[\w]+}
  NAMECASE_ALL_LOWER = %r{^(von|van)$}
  NAMECASE_ALL_CAPS = %r{^(\w\.{0,1}|nyc|i+|iv|x+|llc|llp)$}  # Words to be upcased have to be listed in lowercase, weird, I know

  def titlecase()
    capitalizer(TITLECASE_WORD_REGEXP, TITLECASE_ALL_LOWER, TITLECASE_ALL_CAPS).capitalize_first
  end

  def namecase()
    capitalizer(NAMECASE_WORD_REGEXP, NAMECASE_ALL_LOWER, NAMECASE_ALL_CAPS).capitalize_first
  end
  
  def capitalize_all(force_downcase = true)
    capitalizer(TITLECASE_WORD_REGEXP, TITLECASE_ALL_LOWER, TITLECASE_ALL_CAPS, force_downcase).capitalize_first
  end

  def capitalize_all!(force_downcase = true)
    self.replace(self.capitalize_all(force_downcase))
  end

  def capitalizer(word_regexp, lowercase_regexp = nil, uppercase_regexp = nil, force_downcase = true)
    str = force_downcase ? self.downcase : self

    str.gsub(word_regexp) do |w|
      if lowercase_regexp and lowercase_regexp.match(w)
        w
      elsif uppercase_regexp and uppercase_regexp.match(w)
        w.upcase
      else
        w.capitalize
      end
    end
  end

  def capitalize_first
    self.gsub(/^(.)/m) {|match| match.upcase}
    # something like self[0..0] = self[0..0].upcase might work, but might break unicode strings
  end
  
  def quieter
    # if there are any lowercase letters then it is not in caps
    self == self.upcase ? self.downcase : self
  end
end
