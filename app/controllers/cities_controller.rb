class CitiesController < ApplicationController

  def get_city
    @selected_country = Country.find(params[:id])

    @city = @selected_country.cities.where("title ILIKE ?", "%#{params[:term]}%")
    selected_city = @city.collect do |t|
      { label: t.title }
    end

    render json: selected_city
  end

end
