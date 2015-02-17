class AdvertController < ApplicationController

  def index
    @all = Advert.all
    render "home/index"
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.create(advert_params)
    if @advert.save
      redirect_to @advert
    else
      render 'advert/new'
    end
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])
    @advert.update(advert_params)
    redirect_to @advert
  end

  def show
    @advert = Advert.find(params[:id])
    render 'advert/create'
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
    redirect_to action: 'index'
  end

  private

  def advert_params
    params.require(:advert).permit(:title, :text, :image)
  end

end
