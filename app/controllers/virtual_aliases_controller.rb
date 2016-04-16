class VirtualAliasesController < ApplicationController
  def index
    @domain = VirtualDomain.find_by_name(params.require(:id))
    @virtual_alias = VirtualAlias.new(virtual_domain: @domain)
  end
end
