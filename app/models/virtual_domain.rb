# Email domains
class VirtualDomain < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, domain_name: true

  has_many :virtual_users, foreign_key: :domain_id
  has_many :virtual_aliases, foreign_key: :domain_id

  attr_reader :mx_records

  # What are the DNS MX records for this VirtualDomain
  def mx_records
    @mx_records ||= Resolv::DNS.open do |dns|
      records = dns.getresources(name, Resolv::DNS::Resource::IN::MX)
      records.map(&:exchange).join(" ")
    end
  end

  # Does this VirtualDomain's MX record resolve to the local machine?
  def does_resolve_to_host?
    mx_records.include? Socket.gethostname
  end
end
