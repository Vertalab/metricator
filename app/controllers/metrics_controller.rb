class MetricsController < ApplicationController
  before_action :load_integration
  def reload
    @integration.init_metrics
    redirect_to [@integration, Metric], notice: "Segments reloaded"
  end

  def index
    @metrics = @integration.metrics
  end

  def edit
    @metric = @integration.metrics.find params[:id]
  end

  def show
    @metric = @integration.metrics.find params[:id]
  end

  def update
    @metric = @integration.metrics.find params[:id]
    @metric.update_attributes(metric_params)
    redirect_to [@integration, Metric], notice: "Metric updated"
  end

  private

  def load_integration
    @integration = current_user.integrations.find params[:integration_id]
  end

  def metric_params
    params.require(:metric).permit(:direction, :check_period_hours)
  end
end
