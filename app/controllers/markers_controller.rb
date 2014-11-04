class MarkersController < ApplicationController

  before_action :set_marker, only: [:show, :edit, :update, :destroy]

  def index
    @markers = Marker.all.order(:created_at)
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
        # fix the time
        # @marker.created_at = Time.now
        format.html { redirect_to @marker, notice: 'marker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @marker }
      else
        format.html { render action: 'new' }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @marker.created_at.zone.parse
    respond_to do |format|
      if @marker.update(marker_params)
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
      params[:marker].permit(:id, :blood_sugar, :carbs, :units, :notes, :created_at)
    end

end
