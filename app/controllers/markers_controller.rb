class MarkersController < ApplicationController

  before_action :set_marker, only: [:show, :edit, :destroy]

  def index
    @markers = Marker.all
  end

  def show

  end

  def edit

  end

  def new
    @marker = Marker.new
  end

  def create

    @marker = Marker.new(marker_params)

    respond_to do |format|
      if @marker.save
        format.html { redirect_to @marker, notice: 'marker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @marker }
      else
        format.html { render action: 'new' }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @marker.update(marker_parms)
        format.html { redirect_to @marker, notice: 'Marker updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to markers_url }
      format.json { head :no_content }
    end
  end

  private

    def set_marker
      @marker = Marker.find(params[:id])
    end

    def marker_params
      params[:marker].permit(:id, :blood_sugar, :carbs, :units)
    end

end
