class VirtualAlias < ActiveRecord::Base
  validates :source, presence: true, domain_name: true, email: true
  validates :destination, presence: true, alias: true
  validates :domain_id, presence: true

  belongs_to :virtual_domain, foreign_key: :domain_id

  before_validation :complete_emails

  private

  # Complete email addresses with the domain, if only user name is given
  # Clean up destination list to pass the AliasValidator
  def complete_emails
    self.source += "@#{virtual_domain.name}" unless source =~ /@/
    self.destination += "@#{virtual_domain.name}" unless destination =~ /@/
    self.destination = destination.split(/,| /).select {|ds| !ds.empty? }.map(&:strip).sort.join(", ")
  end

end
