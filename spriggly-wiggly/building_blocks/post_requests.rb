post('/restaurants') do
  new_restaurant = Restaurant.new
  new_restaurant.name = params[:name]
  new_restaurant.location = params[:location]
  new_restaurant.save
  redirect('/')
end

post('/orders') do
  new_order = Order.new
  new_order.description = params[:description]
  new_order.restaurant_id = params[:restaurant_id]
  new_order.save
  redirect('/')
end

post('/api/restaurants') do
  restaurant = Restaurant.new
  restaurant.name = params[:name]
  restaurant.location = params[:location]
  restaurant.save
  json_response = { restaurant: restaurant }.to_json
  return(json_response)
end

post('/api/orders') do
  new_order = Order.new
  new_order.description = params[:description]
  new_order.restaurant_id = params[:restaurant_id]
  new_order.save
  json_response = { order: new_order }.to_json
  return(json_response)
end
