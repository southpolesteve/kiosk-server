class HomeController < ApplicationController
  def index
  end

  def kiosk
    @cpu_id = params[:cpu_id]
  end
end
