# Validates that a string contains only valid email addresses, separated by comma
class AliasValidator < EmailValidator
  def validate_each(record, attribute, value)
    destinations = value.split(",")
    unless destinations.map {|destination|
        self.class.valid? destination.strip
      }.all?
      record.errors[attribute] << (options[:message] || "is not a valid list of email addresses")
    end
  end
end
