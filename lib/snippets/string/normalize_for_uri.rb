#==============================================================================
# String normalize_for_uri - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# Clean a string for use as part of an URI

class String
  def normalize_for_uri
    result = Iconv.new("ascii//ignore//translit", "utf-8").iconv(self.downcase) # Downcase and transliterate
    result = result.gsub(/[^\w\-\_ ]/, "").gsub(/\s+/, "-")   # remove non-alpha and replace spaces
    result = result.gsub(/[-]+/, "-")  # remove repeated dashes
  end
end
