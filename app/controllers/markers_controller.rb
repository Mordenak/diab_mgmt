class MarkersController < ApplicationController

  before_action :set_marker, only: [:show]

  def index
    @markers = Marker.all
  end

  def show

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


  private

    def set_marker
      @marker = Marker.find(params[:id])
    end

    def marker_params
      params[:marker].permit(:id, :blood_sugar, :carbs, :units)
    end

end
