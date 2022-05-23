class CitiesController < ApplicationController
  def index
    @people = City.joins(:postal_codes).where(postal_codes: { code: params[:postal_code_number] }).sort_by(&:name)
    render json: @people
  end
end
