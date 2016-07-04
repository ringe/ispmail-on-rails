# Validates that a string contains only valid email addresses, separated by comma
class AliasValidator < EmailValidator
  def validate_each(record, attribute, value)
    destinations = value.split(", ")
    unless destinations.map {|destination| self.class.valid?(destination) }.all?
      record.errors[attribute] << (options[:message] || "is not a valid list of email addresses")
    end
    existing = VirtualAlias.where(source: record.source, destination: record.destination).count
    if existing != 0
      record.errors[attribute] << (options[:message] || "is already present")
    end
  end
end
