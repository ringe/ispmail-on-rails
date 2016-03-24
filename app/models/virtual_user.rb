# These are the actual email addresses with passwords
class VirtualUser < ActiveRecord::Base
  validates_presence_of :domain_id
  validates :email, uniqueness: true, presence: true, domain_name: true, email: true
  validates :new_password, password: true

  belongs_to :virtual_domain, foreign_key: :domain_id

  attr_accessor :new_password

  before_validation :complete_email
  before_save :encrypt_new_password

  # Capture any misplaced password changes
  def password=(value)
    self.new_password = value
  end

  def password_changing?
    !new_password.blank?
  end

  private
  def complete_email
    unless email =~ /@/
      self.email += "@#{virtual_domain.name}"
    end
  end

  def encrypt_new_password
    if password_changing?
      self["password"] = UnixCrypt::SHA256.build(new_password)
    end
  end
end
