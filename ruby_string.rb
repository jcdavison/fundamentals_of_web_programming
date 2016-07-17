order = 'wings'
puts order

other_order = "fries"
puts other_order

combo_order_1 = order + other_order 
puts combo_order_1

combo_order_2 = "#{order} and #{other_order}"  
puts combo_order_2

combo_order_3 = combo_order_2.sub(/fries/, 'waffles with syrup')
puts combo_order_3

excessive_order = 'wings with fries and more fries and even more fries'
puts excessive_order

better_order = excessive_order.sub(/fries/, 'carrots')
puts better_order

best_order = better_order.gsub(/fries/, 'carrots')
puts best_order

def describe_order(order)
  if order == 'carrots'
    return(order + ' are the best')
  else
    return(order + ' are the worst')
  end
end

some_order = 'hamburger'
some_other_order = 'carrots'

puts describe_order(some_order)
puts describe_order(some_other_order)

first_letter = some_order[0]
puts first_letter
last_letter = some_order[-1]
puts last_letter


healthy_order = 'kale chips with vegan brownies'
iterations = healthy_order.length
puts iterations

iterations.times do |integer|
  puts integer
  puts healthy_order[integer]
end

iterations.times do |integer|
  puts integer
  puts healthy_order[healthy_order.length - integer -1]
end
