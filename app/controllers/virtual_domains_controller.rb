class VirtualDomainsController < ApplicationController
  def index
    @domains = VirtualDomain.all
    @domain = VirtualDomain.new
  end
end
