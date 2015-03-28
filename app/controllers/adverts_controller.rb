class AdvertsController < ApplicationController

    def new
      if user_signed_in?
        @advert = current_user.adverts.build
      else
        flash[:alert] = 'Вы не вошли в систему'
        redirect_to root_url
      end
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
      @advert = Advert.find(params[:id])
    end

    def update
      @advert = Advert.find(params[:id])
      if @advert.update_attributes(advert_params)
        redirect_to @advert
      else
        render 'edit'
      end
    end

    def show
      @advert = Advert.find(params[:id])
      render 'notice'
    end

    def destroy
      @advert = Advert.find(params[:id])
      @advert.destroy
      redirect_to root_url
    end

    private

    def advert_params
      params.require(:advert).permit(:title, :text, :image)
    end

end
