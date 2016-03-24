# Validates the attribute's value includes the virtual_domain.name after an at symbol
class DomainNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    domain = record.virtual_domain.name
    domain_check = Regexp.new "@"+domain+"$"
    unless value =~ domain_check
      record.errors[attribute] << (options[:message] || "is not under #{domain}")
    end
  end
end
