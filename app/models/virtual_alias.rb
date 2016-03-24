class VirtualAlias < ActiveRecord::Base
  belongs_to :virtual_domain, foreign_key: :domain_id
  validates_presence_of :source
  validates_presence_of :destination
  validates_presence_of :domain_id
end
