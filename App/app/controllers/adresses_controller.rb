class AdressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_adress, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ show edit update destroy ]
  before_action :isUnsued, only: %i[ update destroy ]

  def correct_user
    redirect_to adresses_path, notice: 'Not your adress.' if @adress.user != current_user && !current_user.admin
  end

  def isUnsued
    redirect_to adresses_path, notice: 'Adress is used.' if !@adress.pizza_orders.empty?
  end

  # GET /adresses or /adresses.json
  def index
    @adresses = current_user.adresses.search(params[:search]).order(sort_column(Adress.column_names) + " " + sort_direction)
  end

  # GET /adresses/1 or /adresses/1.json
  def show
  end

  # GET /adresses/new
  def new
    @adress = current_user.adresses.build
  end

  # GET /adresses/1/edit
  def edit
  end

  # POST /adresses or /adresses.json
  def create
    @adress = current_user.adresses.build(adress_params)

    respond_to do |format|
      if @adress.save
        format.html { redirect_to adress_url(@adress), notice: "Adress was successfully created." }
        format.json { render :show, status: :created, location: @adress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adresses/1 or /adresses/1.json
  def update
    respond_to do |format|
      if @adress.update(adress_params)
        format.html { redirect_to adress_url(@adress), notice: "Adress was successfully updated." }
        format.json { render :show, status: :ok, location: @adress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1 or /adresses/1.json
  def destroy
    @adress.destroy

    respond_to do |format|
      format.html { redirect_to adresses_url, notice: "Adress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Adress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adress_params
      params.require(:adress).permit(:name, :street_name, :street_number, :city)
    end
end
