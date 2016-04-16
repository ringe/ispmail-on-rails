module Api
  class VirtualAliasesController < Api::BaseController

    private

    def virtual_alias_params
      params.require(:virtual_alias).permit(:source, :destination, :domain_id)
    end

  end
end

