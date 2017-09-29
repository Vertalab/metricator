class Metric < ApplicationRecord
  belongs_to :user
  has_many :metric_values, dependent: :destroy
end
