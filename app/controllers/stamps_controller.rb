class StampsController < ApplicationController
  def create
    @stamp = Stamp.new(params[:stamp])
    flash_message = @stamp.save ? {notice: 'Stamp was successfully created.'} : {alert: 'Error(s) prohibited this stamp from being saved.'}
    redirect_to @stamp.card, flash_message
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
    redirect_to card_url(@stamp.card)
  end
end
