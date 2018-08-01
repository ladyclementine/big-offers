
class API::Offers::OffersController < ApplicationController

    def index
        @offers = Offer.all()

        archived  = params[:archived] ? params[:archived]  : nil
        admin = params[:admin] ? params[:admin] : nil

        if archived != nil 
            offers = Offer.filter_by_archived(archived)
            render :status => 200, :json => {success: true, data: offers } 
            
        elsif admin != nil
            offers = Offer.filter_by_admin(admin)
            render :status => 200, :json => {success: true, data: offers } 
        else
            render :status => 200, :json => {success: true, data: @offers }
        end
    end
end