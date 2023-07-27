class StoragesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_storage, only: %i[ show edit update destroy ]

  def check_admin
    redirect_to root_path, notice: 'You are not an admin' if !current_user.admin
  end

  # GET /storages or /storages.json
  def index
    @storages = Storage.search(params[:search]).includes(:pizzeria_point.name).order(sort_column(Storage.column_names + ["pizzeria_points.name"]) + " " + sort_direction)
  end

  # GET /storages/1 or /storages/1.json
  def show
  end

  # GET /storages/new
  def new
    @storage = Storage.new
  end

  # GET /storages/1/edit
  def edit
  end

  # POST /storages or /storages.json
  def create
    @storage = Storage.new(storage_params)

    respond_to do |format|
      if @storage.save
        format.html { redirect_to storage_url(@storage), notice: "Storage was successfully created." }
        format.json { render :show, status: :created, location: @storage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storages/1 or /storages/1.json
  def update
    respond_to do |format|
      if @storage.update(storage_params)
        format.html { redirect_to storage_url(@storage), notice: "Storage was successfully updated." }
        format.json { render :show, status: :ok, location: @storage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1 or /storages/1.json
  def destroy
    @storage.destroy

    respond_to do |format|
      format.html { redirect_to storages_url, notice: "Storage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_params
      params.require(:storage).permit(:name, :available_cheese, :available_ham, :available_sauce, :available_pineapple, :pizzeria_point_id)
    end
end
