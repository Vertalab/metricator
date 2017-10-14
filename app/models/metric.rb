class Metric < ApplicationRecord
  belongs_to :integration
  has_many :metric_values, dependent: :destroy

  def recent_value
    @recent ||= metric_values.order('id DESC').first
  end

  def up?
    direction == 'up'
  end

  def down?
    direction == 'down'
  end

end
