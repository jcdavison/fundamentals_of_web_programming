# syncronous endpoints

# application root
get('/') do
  restaurants = Restaurant.all
  erb(:index, locals: { restaurants: restaurants })
end

# render a create restaurant form
get('/restaurants/create') do
  erb(:create_restaurant)
end

# render the restaurant of concern to the browser
get('/restaurants/:id/edit') do
  restaurant = Restaurant.get(params[:id])
  render(:edit_restaurant, locals: { restaurant: restaurant })
end

# render the order of concern to the browser
get('/orders/:id/edit') do
  order = Order.get(params[:id])
  erb(:edit_order, locals: { order: order })
end

# single page app
get('/single_page_app') do
  erb(:single_page_app)
end

# asyncronous endpoints

get('/api/restaurants') do
  restaurants = Restaurant.all
  json_response = { restaurants: restaurants }.to_json
  return(json_response)
end

get('/api/restaurants/:id/orders') do
  restaurant = Restaurant.get(params[:id])
  json_response = { orders: restaurant.orders }.to_json
  return(json_response)
end
