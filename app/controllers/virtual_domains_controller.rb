class VirtualDomainsController < ApplicationController
  def index
    @domains = VirtualDomain.includes(:virtual_users).all
    @domain = VirtualDomain.new
  end
end
