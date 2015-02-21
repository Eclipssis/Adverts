class HomeController < ApplicationController
  def index
    @all_adverts = Advert.all
  end
end

