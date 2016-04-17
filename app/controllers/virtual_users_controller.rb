class VirtualUsersController < ApplicationController
  def index
    @domain = VirtualDomain.find_by_name(params.require(:id))
    @virtual_user = VirtualUser.new(virtual_domain: @domain)
  end
end
