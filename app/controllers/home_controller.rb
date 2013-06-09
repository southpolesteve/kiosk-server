class HomeController < ApplicationController
  def index
  end

  def kiosk
    @kiosk = Kiosk.where(cpu_id: params[:cpu_id]).first_or_create
    set_default_config
    render layout: 'kiosk'
  end

  def configure
    @kiosk = Kiosk.find(params[:cpu_id])
  end

  def update
  end

  def instructions
    @kiosk = Kiosk.find(params[:cpu_id])
  end

  private

  def set_default_config
    @kiosk.config = { 1 =>
                   { :url => instructions_kiosk_url(@kiosk),
                     :ttd => 0,
                     :ttr => 0,
                   }
                 }
    @kiosk.save
  end
end
