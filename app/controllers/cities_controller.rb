class CitiesController < ApplicationController

  def autocomplete
    @selected_country = Country.find(params[:id])
    render json: @selected_country.cities.where("title ILIKE ?", "%#{params[:term]}%").map { |city| {label: city.title , city_id: city.id} }
  end

end
