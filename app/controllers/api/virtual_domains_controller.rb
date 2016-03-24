module Api
  class VirtualDomainsController < Api::BaseController

    private

      def virtual_domain_params
        params.require(:virtual_domain).permit(:name)
      end

      def query_params
        params.permit(:name)
      end

  end
end
