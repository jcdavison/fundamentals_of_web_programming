# syncronous endpoints

get('/') do
  restaurants = Restaurant.all
  erb(:index, locals: { restaurants: restaurants })
end

get('/single_page_app') do
  erb(:single_page_app)
end

get('/restaurants/create') do
  erb(:create_restaurant)
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
