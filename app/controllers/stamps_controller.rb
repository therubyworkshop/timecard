class StampsController < ApplicationController
  def create
    @stamp = Stamp.new(params[:stamp])
    if @stamp.save
      redirect_to @stamp.card, notice: 'Stamp was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
    redirect_to card_url(@stamp.card)
  end
end
