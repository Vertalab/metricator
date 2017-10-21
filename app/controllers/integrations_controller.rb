class IntegrationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @integrations = current_user.integrations
  end


  def destroy
    @integration = current_user.integrations.find(params[:id])
    @integration.destroy
    redirect_to Integration, notice: "Integration removed"
  end

  def intercom
    @integration = current_user.integrations.new
    @integration.provider = 'intercom'
    @integration.token = request.env["omniauth.auth"]["credentials"]["token"]
    @integration.save


    @integration.update_values!

    redirect_to action: :index, notice: "Integration added"
  end
end
