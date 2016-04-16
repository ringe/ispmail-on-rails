class VirtualAlias < ActiveRecord::Base
  belongs_to :virtual_domain, foreign_key: :domain_id
  validates :source, presence: true, domain_name: true, email: true
  validates :destination, presence: true, domain_name: true, email: true
  validates :domain_id, presence: true
end
