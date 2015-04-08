class ResultsController < ApplicationController

  def index
    @search_results = Advert.search_by_adverts(params[:query])
  end

end
