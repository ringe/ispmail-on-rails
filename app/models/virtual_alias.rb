class VirtualAlias < ActiveRecord::Base
  validates :source, presence: true, domain_name: true, email: true
  validates :destination, presence: true, email: true
  validates :domain_id, presence: true

  belongs_to :virtual_domain, foreign_key: :domain_id

  before_validation :complete_emails

  private
  def complete_emails
    self.source += "@#{virtual_domain.name}" unless source =~ /@/
    self.destination += "@#{virtual_domain.name}" unless destination =~ /@/
  end

end
