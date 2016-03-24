# Email domains
class VirtualDomain < ActiveRecord::Base
  self.table_name = "domains"
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :virtual_users, foreign_key: :domain_id
  has_many :virtual_aliases, foreign_key: :domain_id
end
