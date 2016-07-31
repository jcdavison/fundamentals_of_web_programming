# edit a restaurant
put('/restaurants/:id') do
  restaurant = Restaurant.get(params[:id])
  restaurant.name = params[:name]
  restaurant.location = params[:location]
  restaurant.save
  redirect('/')
end

# update an order
put('/orders/:id') do
  order = Order.get(params[:id])
  order.description = params[:description]
  order.save
  redirect('/')
end
