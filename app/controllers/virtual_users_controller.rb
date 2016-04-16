class VirtualUsersController < ApplicationController
  def index
    @domain = VirtualDomain.find_by_name(params.require(:id))
    @virtual_user = VirtualUser.new(virtual_domain: @domain)
    unless @domain.does_resolve_to_host?
      flash[:info] = @domain.name + " MX record does not resolve to this server"
    end
  end
end
