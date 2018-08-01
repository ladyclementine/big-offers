class OffersController < BaseController
  before_action :check_permission, only: [:edit, :update]
  before_action :set_offer, only: [:show, :edit, :update, :archive]

  def index
    @offers = Offer.all.where.not(:archived => true).order('created_at DESC').paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.js
    end
    @offer = Offer.new
  end
  
  def archived_list
    @offers = Offer.all.where(:archived => true)
  end

  def new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.created_by = current_admin.email
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Oferta criada com sucesso!' }
        format.js
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offers_path, notice: 'Oferta atualizada com sucesso!.' }
      else
        format.html { render :edit }
      end
    end
  end

  def archive
    @offer.update_attributes(:archived => true, :archived_at => Time.now())
    redirect_to archived_list_path
  end

  private
  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :description, :avatar, :price, :created_by, :archived, :archived_at)
  end
  
  #checa se o admin possui permissão para editar
  def check_permission
    unless current_admin.has_permission?
      redirect_to offers_path
    end
  end

end
