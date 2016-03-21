class VirtualDomain < ActiveRecord::Base
  self.table_name = "domains"

  has_many :virtual_users
  has_many :virtual_aliases
end
