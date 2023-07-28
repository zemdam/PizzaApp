# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Ingredients Prices:
same_price = IngredientsPrice.create(cheese_price: 3, ham_price: 3, sauce_price: 3, pineapple_price: 3, name: "Same price")
free_price = IngredientsPrice.create(cheese_price: 0, ham_price: 0, sauce_price: 0, pineapple_price: 0, name: "Free price")
sample_price = IngredientsPrice.create(cheese_price: 3, ham_price: 4, sauce_price: 5, pineapple_price: 6, name: "Sample price")

# Pizza sizes:
PizzaSize.create(p_size: 15, basic_price: 15, name: "Small")
medium_size = PizzaSize.create(p_size: 30, basic_price: 30, name: "Medium")
PizzaSize.create(p_size: 45, basic_price: 45, name: "Big")

# Pizza types:
PizzaType.create(required_cheese: 1, required_sauce: 0, required_ham: 1, required_pineapple: 0, name: "Capricciosa")
PizzaType.create(required_cheese: 1, required_sauce: 0, required_ham: 1, required_pineapple: 1, name: "Hawaiian")
PizzaType.create(required_cheese: 1, required_sauce: 1, required_ham: 0, required_pineapple: 0, name: "Pepperoni")
mix_type = PizzaType.create(required_cheese: 1, required_sauce: 1, required_ham: 1, required_pineapple: 1, name: "Mix")

# Pizzeria points:
free_pizza = PizzeriaPoint.create(name: "Free Pizza", ingredients_price_id: free_price.id)
same_pizza = PizzeriaPoint.create(name: "Same Pizza", ingredients_price_id: same_price.id)
sample_pizza = PizzeriaPoint.create(name: "Sample Pizza", ingredients_price_id: sample_price.id)

# Storages:
Storage.create(available_cheese: 0, available_ham: 0, available_sauce: 0, available_pineapple: 0, pizzeria_point_id: free_pizza.id, name: "Empty storage")
Storage.create(available_cheese: 100, available_ham: 100, available_sauce: 100, available_pineapple: 100, pizzeria_point_id: same_pizza.id, name: "Big storage")
Storage.create(available_cheese: 10, available_ham: 10, available_sauce: 10, available_pineapple: 10, pizzeria_point_id: sample_pizza.id, name: "Small storage 1")
Storage.create(available_cheese: 10, available_ham: 10, available_sauce: 10, available_pineapple: 10, pizzeria_point_id: sample_pizza.id, name: "Small storage 2")
Storage.create(available_cheese: 10, available_ham: 10, available_sauce: 10, available_pineapple: 10, pizzeria_point_id: sample_pizza.id, name: "Small storage 3")
Storage.create(available_cheese: 10, available_ham: 10, available_sauce: 10, available_pineapple: 10, pizzeria_point_id: sample_pizza.id, name: "Small storage 4")
Storage.create(available_cheese: 10, available_ham: 10, available_sauce: 10, available_pineapple: 10, pizzeria_point_id: sample_pizza.id, name: "Small storage 5")

# Users:
User.create(email: "admin@pizza.com", password: "admin12", password_confirmation: "admin12", admin: true, first_name: "admin", last_name: "admin", phone_number: 000)
sample_user = User.create(email: "user@pizza.com", password: "user12", password_confirmation: "user12", admin: false, first_name: "user", last_name: "user", phone_number: 000)

# Adresses:
sample_adress = Adress.create(street_name: "Sample street", street_number: "1", city: "Sample city", name: "Sample adress", user_id: sample_user.id)

# Pizza orders:
PizzaOrder.create(ingredients_multiplayer: 1, pizza_type_id: mix_type.id, pizza_size_id: medium_size.id, adress_id: sample_adress.id, pizzeria_point_id: sample_pizza.id, user_id: sample_user.id)