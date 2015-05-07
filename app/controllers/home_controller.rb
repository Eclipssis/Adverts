class HomeController < ApplicationController
  def index
    @all_adverts = Advert.order(created_at: :desc).page(params[:page]).per(12)
  end
end

