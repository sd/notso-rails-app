#==============================================================================
# ERB html_escape - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# ERB's html_escape insists on escaping already escaped entities
# We changed it so that, by default, it leaves those intact

module ERB::Util
  def html_escape(s, escape_all = false)
    if escape_all
      s.to_s.gsub(/&/, "&amp;").gsub(/\"/, "&quot;").gsub(/>/, "&gt;").gsub(/</, "&lt;")
    else
      s.to_s.gsub(/&(?![\#\d\w]+;)/, "&amp;").gsub(/\"/, "&quot;").gsub(/>/, "&gt;").gsub(/</, "&lt;")
    end
  end
  alias h html_escape
  module_function :h
  module_function :html_escape
end
