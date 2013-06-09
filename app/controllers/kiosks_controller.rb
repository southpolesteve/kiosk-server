class KiosksController < ApplicationController

  def show
    @kiosk = Kiosk.where(cpu_id: params[:id]).first_or_create
    set_default_config if @kiosk.new?
    render layout: 'kiosk'
  end

  def edit
    @kiosk = Kiosk.find(params[:id])
  end

  def update
    @kiosk = Kiosk.find(params[:id])
    @kiosk.update_attributes(params[:kiosk])
    redirect_to edit_kiosk_path(@kiosk)
  end

  def instructions
    @kiosk = Kiosk.find(params[:id])
  end

  private

  def set_default_config
    @kiosk.slides.new url: instructions_kiosk_url(@kiosk), display_time: 0, refresh_time: 0, position: 1
    @kiosk.default_configured
  end
end