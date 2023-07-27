class PizzaOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pizza_order, only: %i[ show edit update destroy complete ]
  before_action :isCompleted, only: %i[ edit update destroy ]
  before_action :canComplete, only: %i[ complete ]

  def pizzaOrderWithNames
    return PizzaOrder.search(params[:search]).includes(:pizza_type.name, :pizza_size.name, :adress.name, :pizzeria_point.name)
  end

  # GET /pizza_orders or /pizza_orders.json
  def index
    if current_user.admin
      @pizza_orders = pizzaOrderWithNames.order(sort_column(COLUMN_NAMES) + " " + sort_direction)
    else
      @pizza_orders = current_user.pizza_orders.search(params[:search]).includes(:pizza_type.name, :pizza_size.name, :adress.name, :pizzeria_point.name).order(sort_column(COLUMN_NAMES) + " " + sort_direction)
    end
  end

  # GET /pizza_orders/1 or /pizza_orders/1.json
  def show
  end

  # GET /pizza_orders/new
  def new
    @pizza_order = current_user.pizza_orders.build
  end

  # GET /pizza_orders/1/edit
  def edit
  end

  def canComplete
    redirect_to pizza_orders_path, notice: "Can't complete order" if @pizza_order.date_of_order || !current_user.admin
  end

  def isCompleted
    redirect_to pizza_orders_path, notice: 'Order is completed' if @pizza_order.date_of_order && !current_user.admin
  end

  # POST /pizza_orders or /pizza_orders.json
  def create
    @pizza_order = current_user.pizza_orders.build(pizza_order_params)

    respond_to do |format|
      if @pizza_order.save
        format.html { redirect_to pizza_order_url(@pizza_order), notice: "Pizza order was successfully created." }
        format.json { render :show, status: :created, location: @pizza_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizza_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_orders/1 or /pizza_orders/1.json
  def update
    respond_to do |format|
      if @pizza_order.update(pizza_order_params)
        format.html { redirect_to pizza_order_url(@pizza_order), notice: "Pizza order was successfully updated." }
        format.json { render :show, status: :ok, location: @pizza_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizza_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkStorages
    needed_cheese = @pizza_order.ingredients_multiplayer * @pizza_order.pizza_type.required_cheese
    needed_sauce = @pizza_order.ingredients_multiplayer * @pizza_order.pizza_type.required_sauce
    needed_ham = @pizza_order.ingredients_multiplayer * @pizza_order.pizza_type.required_ham
    needed_pineapple = @pizza_order.ingredients_multiplayer * @pizza_order.pizza_type.required_pineapple

    cheese = 0
    sauce = 0
    ham = 0
    pineapple = 0

    can_be_done = false

    @pizza_order.storages.each do |s|
      cheese += s.available_cheese
      sauce += s.available_sauce
      ham += s.available_ham
      pineapple += s.available_pineapple

      if cheese >= needed_cheese && sauce >= needed_sauce && ham >= needed_ham && pineapple >= needed_pineapple
        can_be_done = true
        break
      end
    end

    if can_be_done
      @pizza_order.storages.each do |s|
        s.available_cheese -= [s.available_cheese, needed_cheese].min
        needed_cheese -= [s.available_cheese, needed_cheese].min
        s.available_sauce -= [s.available_sauce, needed_sauce].min
        needed_sauce -= [s.available_sauce, needed_sauce].min
        s.available_ham -= [s.available_ham, needed_ham].min
        needed_ham -= [s.available_ham, needed_ham].min
        s.available_pineapple -= [s.available_pineapple, needed_pineapple].min
        needed_pineapple -= [s.available_pineapple, needed_pineapple].min
        s.save(validate: false)

        if needed_cheese == 0 && needed_sauce == 0 && needed_ham == 0 && needed_pineapple == 0
          break
        end
      end
    end

    return can_be_done
  end

  def complete
    if checkStorages
      respond_to do |format|
        if @pizza_order.update_attribute(:date_of_order, Time.now)
          format.html { redirect_to pizza_orders_path, notice: "Pizza order completed." }
          format.json { render :show, status: :ok, location: @pizza_order }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @pizza_order.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to pizza_orders_path, notice: 'Not enough ingredients in storages'
    end
  end

  # DELETE /pizza_orders/1 or /pizza_orders/1.json
  def destroy
    @pizza_order.destroy

    respond_to do |format|
      format.html { redirect_to pizza_orders_url, notice: "Pizza order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_order
      @pizza_order = PizzaOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_order_params
      params.require(:pizza_order).permit(:ingredients_multiplayer, :pizza_type_id, :pizza_size_id, :adress_id, :pizzeria_point_id)
    end

    COLUMN_NAMES = PizzaOrder.column_names + ["pizza_types.name", "pizza_sizes.name", "adresses.name", "pizzeria_points.name"]
end
