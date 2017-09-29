class IntegrationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @integrations = current_user.integrations
  end
end
