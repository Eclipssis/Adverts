class AdvertsController < ApplicationController

    def index
      @all_adverts = Advert.all
      render "home/index"
    end

    def new
      if user_signed_in?
        @advert = current_user.adverts.build
      else
        flash[:alert] = 'Вы не вошли в систему'
        redirect_to action: 'index'
      end
    end

    def create
      @advert = current_user.adverts.create(advert_params)
      if @advert.save

        redirect_to @advert
      else
        render 'adverts/new'
      end
    end

    def edit
      @advert = Advert.find(params[:id])
    end

    def update
      @advert = Advert.find(params[:id])
      if @advert.save
        @advert.update(advert_params)
        redirect_to @advert
      else
        render 'adverts/edit'
      end
    end

    def show
      @advert = Advert.find(params[:id])
      @uesr_fio = User.find(@advert.user_id).fio
      render 'adverts/create'
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
