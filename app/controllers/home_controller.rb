class HomeController < ApplicationController
  def index
    @all = Advert.all
  end
end

