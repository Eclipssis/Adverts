class AdvertsController < ApplicationController

  load_and_authorize_resource
  skip_load_resource :only => :create

  def new

  end

  def create
    @advert = current_user.adverts.create(advert_params)
    if @advert.save
      render 'notice'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @advert.update_attributes(advert_params)
      redirect_to @advert
    else
      render 'edit'
    end
  end

  def show
    render 'notice'
  end

  def destroy
    @advert.destroy
    redirect_to root_url
  end

  private

    def advert_params
      params.require(:advert).permit(:title, :text, :image)
    end

end
