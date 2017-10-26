class Integration < ApplicationRecord
  has_many :metrics
  belongs_to :user

  def init_metrics
    intercom = Intercom::Client.new(token: token)
    segments = intercom.segments.all.map {|segment| [segment.name, segment.id] }

    segments.each do |s|
      m = metrics.find_or_create_by({
        metric_source_type: 'segment',
        metric_source: s[0],
      }) do |metric|
        metric.check_period_hours = 24
        metric.direction = 'up'
        metric.active = true
      end
    end
  end

  def update_values!
    init_metrics
    intercom = Intercom::Client.new(token: token)
    counts = intercom.counts.for_type(type: 'user', count: 'segment')
    counts.to_hash["user"]["segment"].each do |val|
      key = val.keys.first
      count = val.values.first
      metric = metrics.find_by metric_source: key
      last_value = metric.metric_values.order('id DESC').first
      next if last_value && last_value.created_at.yday == Time.now.yday
      value = metric.metric_values.new
      value.value = count
      value.delta = value.value - (last_value&.value || 0)
      value.delta_percent = last_value && last_value&.value != 0 ? ((value.delta.abs.to_f / last_value&.value) * 100).to_i : 500
      value.measured_at = Time.now
      value.save
    end
  end
end
