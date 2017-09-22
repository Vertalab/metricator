class VisitorsController < ApplicationController
  after_action :intercom_shutdown, only: [:index]

  protected

  def intercom_shutdown
    IntercomRails::ShutdownHelper.intercom_shutdown(session, cookies)
  end
end
