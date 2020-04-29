class PlacesController < ApplicationController
  before_action :set_place, only: [:show]

  # GET /places
  def index
    @category = Category.find_by("lower(categories.titles ->> 'en') = ''".insert(-2, params[:category].to_s))
    @places = Place.order_by_title.title_not_eq('')
    @places = @places.by_category(@category) if @category
  end

  def account
    @places = Place.where(user_id: current_user.id)
    render :index
  end

  # GET /places/1
  def show; end

  # GET /places/new
  def new
    if logged_in?
      @place = Place.new
    else
      redirect_to new_session_path, notice: t('messages.connexion')
    end
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: t('messages.create') }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:title, :description, :price_chf, :duration_minutes, :schedule, :lat, :lng, :image, :user_id, category_ids: [])
  end
end
