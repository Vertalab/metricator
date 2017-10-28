module MetricsHelper
  def check_periods
    [['Daily', 24]]
  end

  def directions
    [['Increase', 'up'], ['Decrease', 'down']]
  end

  def show_delta_percents(m)
    percent = (m.recent_value.delta_percent * 100).to_i / 100.0

    content_tag(:span, "#{m.recent_value.delta > 0 ? '+' : m.recent_value.delta == 0 ? '' : ''}#{m.recent_value.delta != 0 ? m.recent_value.delta : ''} #{m.recent_value.delta != 0 ? '/' : ''} #{percent}%", class: "label #{m.up? && m.recent_value.delta > 0 || m.down? && m.recent_value.delta < 0 ? 'label-success' : m.recent_value.delta == 0 ? 'label-default' : 'label-danger'}")
  end
end
