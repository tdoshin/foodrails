class FoodmodelsController < ApplicationController
  before_action :authorized
  before_action :set_foodmodel, only: [:show, :update, :destroy]

  # GET /foodmodelsall
  def index_all
    @foodmodels = Foodmodel.all

    render json: @foodmodels
  end
  
  # GET /foodmodels
  def index
    # @foodmodels = Foodmodel.all
    @foodmodels = Foodmodel.where(user_id: @user.id)

    render json: @foodmodels
  end

  # GET /foodmodels/1
  def show
    render json: @foodmodel
  end

  # POST /foodmodels
  def create
    @foodmodel = Foodmodel.new(foodmodel_params)
    @foodmodel.user_id = @user.id

    if @foodmodel.save
      # render json: @foodmodel, status: :created, location: @foodmodel
      render json: @foodmodel, status: :created
    else
      render json: @foodmodel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foodmodels/1
  def update
    if @foodmodel.update(foodmodel_params)
      render json: @foodmodel
    else
      render json: @foodmodel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foodmodels/1
  def destroy
    @foodmodel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodmodel
      @foodmodel = Foodmodel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foodmodel_params
      params.require(:foodmodel).permit(:name, :image, :recipe)
    end
end
