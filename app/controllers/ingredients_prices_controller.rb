class IngredientsPricesController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :check_admin, except: %i[ show ]
  before_action :set_ingredients_price, only: %i[ show edit update destroy ]

  def check_admin
    redirect_to root_path, notice: 'You are not an admin' if !current_user.admin
  end

  # GET /ingredients_prices or /ingredients_prices.json
  def index
    @ingredients_prices = IngredientsPrice.search(params[:search]).order(sort_column(IngredientsPrice.column_names) + " " + sort_direction)
  end

  # GET /ingredients_prices/1 or /ingredients_prices/1.json
  def show
  end

  # GET /ingredients_prices/new
  def new
    @ingredients_price = IngredientsPrice.new
  end

  # GET /ingredients_prices/1/edit
  def edit
  end

  # POST /ingredients_prices or /ingredients_prices.json
  def create
    @ingredients_price = IngredientsPrice.new(ingredients_price_params)

    respond_to do |format|
      if @ingredients_price.save
        format.html { redirect_to ingredients_price_url(@ingredients_price), notice: "Ingredients price was successfully created." }
        format.json { render :show, status: :created, location: @ingredients_price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredients_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients_prices/1 or /ingredients_prices/1.json
  def update
    respond_to do |format|
      if @ingredients_price.update(ingredients_price_params)
        format.html { redirect_to ingredients_price_url(@ingredients_price), notice: "Ingredients price was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredients_price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredients_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients_prices/1 or /ingredients_prices/1.json
  def destroy
    @ingredients_price.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_prices_url, notice: "Ingredients price was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredients_price
      @ingredients_price = IngredientsPrice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredients_price_params
      params.require(:ingredients_price).permit(:name, :cheese_price, :ham_price, :sauce_price, :pineapple_price)
    end
end
