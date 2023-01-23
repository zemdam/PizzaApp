class PizzeriaPointsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :check_admin, except: %i[ index show ]
  before_action :set_pizzeria_point, only: %i[ show edit update destroy ]

  def check_admin
    redirect_to root_path, notice: 'You are not an admin' if !current_user.admin
  end

  # GET /pizzeria_points or /pizzeria_points.json
  def index
    @pizzeria_points = PizzeriaPoint.search(params[:search]).includes(:ingredients_price.name).order(sort_column(PizzeriaPoint.column_names + ["ingredients_prices.name"]) + " " + sort_direction)
  end

  # GET /pizzeria_points/1 or /pizzeria_points/1.json
  def show
  end

  # GET /pizzeria_points/new
  def new
    @pizzeria_point = PizzeriaPoint.new
  end

  # GET /pizzeria_points/1/edit
  def edit
  end

  # POST /pizzeria_points or /pizzeria_points.json
  def create
    @pizzeria_point = PizzeriaPoint.new(pizzeria_point_params)

    respond_to do |format|
      if @pizzeria_point.save
        format.html { redirect_to pizzeria_point_url(@pizzeria_point), notice: "Pizzeria point was successfully created." }
        format.json { render :show, status: :created, location: @pizzeria_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizzeria_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizzeria_points/1 or /pizzeria_points/1.json
  def update
    respond_to do |format|
      if @pizzeria_point.update(pizzeria_point_params)
        format.html { redirect_to pizzeria_point_url(@pizzeria_point), notice: "Pizzeria point was successfully updated." }
        format.json { render :show, status: :ok, location: @pizzeria_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizzeria_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzeria_points/1 or /pizzeria_points/1.json
  def destroy
    @pizzeria_point.destroy

    respond_to do |format|
      format.html { redirect_to pizzeria_points_url, notice: "Pizzeria point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizzeria_point
      @pizzeria_point = PizzeriaPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizzeria_point_params
      params.require(:pizzeria_point).permit(:name, :ingredients_price_id)
    end
end
