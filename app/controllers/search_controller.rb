class SearchController < ApplicationController

  def index
    @search_results = Advert.search_by_adverts(params[:query]).page(params[:page]).per(12)
  end

end
