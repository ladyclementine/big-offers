
class API::Offers::OffersController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :destroy_session

    def index
        pag     = params[:page]    ? params[:page]    : 1
        limit   = params[:limit]   ? params[:limit]   : 30
        archived  = params[:archived] ? params[:archived]  : nil
        admin = params[:admin] ? params[:admin] : nil

        offers =  Offer.filter(archived, admin, pag, limit)
        render :status => 200, :json => {success: true, data: offers }
    end

    def destroy_session
        request.session_options[:skip] = true
    end

end