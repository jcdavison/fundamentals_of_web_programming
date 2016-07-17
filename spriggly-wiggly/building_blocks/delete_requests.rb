delete('/restaurants/:id') do
  Restaurant.get(params[:id]).destroy
  redirect('/')
end

delete('/orders') do
  order_to_delete = Order.get(params[:order_id])
  order_to_delete.destroy
  redirect('/')
end

delete('/api/restaurants/:id') do
  Restaurant.get(params[:id]).destroy
  json_response = { empty: true }.to_json
  return(json_response)
end
