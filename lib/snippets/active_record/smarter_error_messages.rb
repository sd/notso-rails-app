#==============================================================================
# ActiveRecord Smarter Error Messages - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# ActiveRecord error messages can be customized, but are hardcoded to start with
# the field name. So you can't use something like "It needs a title" for the
# :title field.
#
# This snippet adds support for :attr as a placeholder for the attribute name.
# If it's not present, it will fall back to the original behaviour of prepending
# it at the start of the message.
#
# It also allows for :noattr as a flag to indicate that the message should not
# include the attribute name (:noattr it gets replaced with an empty string)

class ActiveRecord::Errors
  def full_messages_with_templated_attr_name
    full_messages = []

    @errors.each_key do |attr|
      @errors[attr].each do |msg|
        next if msg.nil?

        if attr == "base"
          message = msg
        else
          if msg.include? ":attr"
            message = msg.gsub(":attr", @base.class.human_attribute_name(attr))
          elsif msg.include? ":noattr"
            message = msg.gsub(":noattr", "")
          else
            message = @base.class.human_attribute_name(attr) + " " + msg
          end
        end
        full_messages << message
      end
    end

    return full_messages
  end
  alias_method :full_messages_without_templated_attr_name, :full_messages
  alias_method :full_messages, :full_messages_with_templated_attr_name
end
