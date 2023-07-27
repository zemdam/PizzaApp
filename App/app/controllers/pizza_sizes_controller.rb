class PizzaSizesController < ApplicationController
  before_action :check_admin, except: %i[ index show ]
  before_action :set_pizza_size, only: %i[ show edit update destroy ]

  def check_admin
    redirect_to pizza_sizes_path, notice: 'You are not an admin' if !current_user.admin
  end

  # GET /pizza_sizes or /pizza_sizes.json
  def index
    @pizza_sizes = PizzaSize.search(params[:search]).order(sort_column(PizzaSize.column_names) + " " + sort_direction)
  end

  # GET /pizza_sizes/1 or /pizza_sizes/1.json
  def show
  end

  # GET /pizza_sizes/new
  def new
    @pizza_size = PizzaSize.new
  end

  # GET /pizza_sizes/1/edit
  def edit
  end

  # POST /pizza_sizes or /pizza_sizes.json
  def create
    @pizza_size = PizzaSize.new(pizza_size_params)

    respond_to do |format|
      if @pizza_size.save
        format.html { redirect_to pizza_size_url(@pizza_size), notice: "Pizza size was successfully created." }
        format.json { render :show, status: :created, location: @pizza_size }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizza_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_sizes/1 or /pizza_sizes/1.json
  def update
    respond_to do |format|
      if @pizza_size.update(pizza_size_params)
        format.html { redirect_to pizza_size_url(@pizza_size), notice: "Pizza size was successfully updated." }
        format.json { render :show, status: :ok, location: @pizza_size }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizza_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizza_sizes/1 or /pizza_sizes/1.json
  def destroy
    @pizza_size.destroy

    respond_to do |format|
      format.html { redirect_to pizza_sizes_url, notice: "Pizza size was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_size
      @pizza_size = PizzaSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_size_params
      params.require(:pizza_size).permit(:name, :p_size, :basic_price)
    end
end
