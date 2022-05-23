class StreetsController < ApplicationController
  def index
    @streets = Street.where(city_id: params[:city_id]).sort_by(&:name)
    render json: @streets
  end
end
