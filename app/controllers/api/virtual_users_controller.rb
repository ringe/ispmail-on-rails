module Api
  class VirtualUsersController < Api::BaseController

    private

    def virtual_user_params
      params.require(:virtual_user).permit(:email, :domain_id, :new_password)
    end

    def query_params
      params.permit(:email)
    end

  end
end
