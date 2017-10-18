module MetricsHelper
  def check_periods
    [['Daily', 24]]
  end

  def directions
    [['Increase', 'up'], ['Decrease', 'down']]
  end

  def show_delta_percents(m)
    content_tag(:span, "#{m.up? && m.recent_value.delta > 0 ? '+' : m.recent_value.delta == 0 ? '' : '-'} #{m.recent_value.delta_percent.to_i}%", class: "label #{m.up? && m.recent_value.delta > 0 || m.down? && m.recent_value.delta < 0 ? 'label-success' : m.recent_value.delta == 0 ? 'label-default' : 'label-danger'}")
  end
end
