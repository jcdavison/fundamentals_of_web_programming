require 'sinatra'

set :bind, '127.0.0.1'
set :port, 3000

get('/') do
  return('hello') 
end

get('/emphatic_greeting') do
  greeting = 'hello ' * 1000
  return(greeting) 
end

get('/emphatic_greeting.html') do
  weird_emphatic_greeting = 'HeLL0 FR1enD ' * 1000
  return(weird_emphatic_greeting) 
end

get('/dynamic_greeting/:greeting/:count') do
  greeting = "<h3>#{params[:greeting]}<h3>"
  count = params[:count].to_i
  greetings = greeting * count
  page_content = "<html><body>#{greetings}</body></html>"
  return(page_content)
end

get('/waffle.html') do
  waffles = '<h1>waffles</h1>'
  page_content = "<html><body>#{waffles * 10}</body></html>"
  return(page_content)
end

get('/waffle_count.html') do
  waffles = []
  10.times do |n|
    waffle_with_count = "<h1>waffle #{n}</h1>"
    waffles.push(waffle_with_count)
  end
  waffle_page_content = "<html><body>#{waffles.join()}</body></html>"
  return(waffle_page_content)
end

post('/order') do
  order = params[:order]
  order_page_message = "<h3>Yum, Yum here is your #{order}</h3>"
  order_page_html = "<html><body>#{order_page_message}</body></html>"
  return(order_page_html)
end

put('/order_update') do
  updated_order = params[:order_update]
  update_page_message = "<h3>Woops, here is your updated #{updated_order}</h3>"
  update_page_html = "<html><body>#{update_page_message}</body></html>"
  return(order_page_html)
end

delete('/order_delete') do
  deleted_order = params[:deleted_order]
  delete_page_message = "<h3>Happy? We deleted your #{deleted_order}</h3>"
  delete_page_html = "<html><body>#{delete_page_message}</body></html>"
  return(delete_page_html)
end
