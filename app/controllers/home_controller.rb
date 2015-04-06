class HomeController < ApplicationController
  def index
    @all_adverts = Advert.order(:title).page(params[:page]).per(12)
  end
end

