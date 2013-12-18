class  PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new params[:place]
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    @place = Place.find params[:id]
    render :edit
  end

  def update
    @place = Place.find params[:id]
    if @place.update_attributes params[:place]
      redirect_to places_path
    else
      render :edit
    end
  end

  def destroy
    place = Place.find params[:id]
    place.destroy
    redirect_to places_path
  end

end
