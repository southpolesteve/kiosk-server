class HomeController < ApplicationController
  def index
  end

  def kiosk
    @cpu_id = params[:cpu_id]
    render layout: 'kiosk'
  end
end
