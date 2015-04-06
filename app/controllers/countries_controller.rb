class CountriesController < ApplicationController

  def get_country
    @country = Country.where("title ILIKE ?", "%#{params[:term]}%")
    selected_country = @country.collect do |t|
      { label: t.title, country_id: t.id }
    end

    render json: selected_country
  end

end
