class StreetNumbersController < ApplicationController
  def index
    @street_numbers = StreetNumber.where(street_id: params[:street_id]).sort_by(&:number)
    render json: @street_numbers
  end
end
