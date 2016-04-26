# Validates the attribute's value includes the virtual_domain.name after an at symbol
class DomainNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.class == VirtualDomain
      domain_check = Regexp.new "^[a-zA-Z0-9][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9]{0,1}\.([a-zA-Z]{1,6}|[a-zA-Z0-9-]{1,30}\.[a-zA-Z]{2,})$"
      tld = value.split(".").last
      unless IANA::TLD.valid?(tld)
        record.errors[attribute] << (options[:message] || ".#{tld} is not accepted by IANA as a Top Level Domain")
      end
      unless record.name =~ domain_check
        record.errors[attribute] << (options[:message] || "is not a valid domain name")
      end
    else
      domain = record.virtual_domain.name
      domain_check = Regexp.new "@"+domain+"$"
      unless value =~ domain_check
        record.errors[attribute] << (options[:message] || "is not under #{domain}")
      end
    end
  end
end
