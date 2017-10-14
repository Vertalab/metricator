require 'sidekiq-scheduler'

class CheckValuesJob
  include Sidekiq::Worker


  def perform(*args)
    Integration.all.each do |i|
      i.update_values!
    end
  end
end
