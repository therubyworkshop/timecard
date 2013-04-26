class StampsController < ApplicationController
  # GET /stamps
  # GET /stamps.json
  def index
    @stamps = Stamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stamps }
    end
  end

  # POST /stamps
  # POST /stamps.json
  def create
    @stamp = Stamp.new(params[:stamp])

    respond_to do |format|
      if @stamp.save
        format.html { redirect_to @stamp, notice: 'Stamp was successfully created.' }
        format.json { render json: @stamp, status: :created, location: @stamp }
      else
        format.html { render action: "new" }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stamps/1
  # DELETE /stamps/1.json
  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy

    respond_to do |format|
      format.html { redirect_to stamps_url }
      format.json { head :no_content }
    end
  end
end
