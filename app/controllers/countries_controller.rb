class CountriesController < ApplicationController

  def autocomplete
    @country = Country.where("title ILIKE ?", "%#{params[:term]}%")
    render json: @country.map { |country| {label: country.title, country_id: country.id} }
  end

end
