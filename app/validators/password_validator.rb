# Validates the attribute's value is an acceptable password
class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.password_changing? && value.to_s.size <= 10
      record.errors[attribute] << (options[:message] || "must be minimum 10 characters long")
    elsif record.password.blank? && !record.password_changing?
      record.errors[attribute] << (options[:message] || "must be set")
    end
  end
end
