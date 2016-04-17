class VirtualDomainsController < ApplicationController
  def index
    @domains = VirtualDomain.includes(:virtual_users, :virtual_aliases).all
    @domain = VirtualDomain.new
  end
end
