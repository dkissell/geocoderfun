class LocationsController < ApplicationController
  def index
    @title = 'Geocode'
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def show
    @title = 'Geocode'

    @location = Location.find(params[:id])
  end

  def new
    @title = 'Geocode'

    @location = Location.new
  end

  def create
    @title = 'Geocode'

    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = 'Geocode'

    @location = Location.find(params[:id])
  end

  def update
    @title = 'Geocode'

    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @title = 'Geocode'

    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end
end
