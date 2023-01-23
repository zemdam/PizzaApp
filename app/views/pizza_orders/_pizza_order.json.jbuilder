json.extract! pizza_order, :id, :ingredients_multiplayer, :pizza_type_id, :pizza_size_id, :adress_id, :pizzeria_point_id, :created_at, :updated_at
json.url pizza_order_url(pizza_order, format: :json)
