things = [ 'john', 'jane', :happy, nil, false, {}, [] ]
p things
p things.class
p things.length

p things[3]
p things[-1]
p things[0]

iterations = things.length

iterations.times do |integer|
  p things[integer]
end

iterations.times do |integer|
  index_position = things.length - integer - 1
  p things[index_position]
end

people = ['jane', 'john', 'jim', 'jenny']

people.each do |person|
  p "this person's name #{person}"
end

other_people = people.each do |person|
  p person.reverse
end

p other_people
p people == other_people

scrambled_people = people.map do |person|
  person.reverse
end

p scrambled_people
p people == scrambled_people

def create_funny_sentence(people)
  people.inject('') do |sentence, person|
    sentence << " look at #{person} go,"
    sentence
  end
end

p people

p people.pop
p people
p people.push('jonathon')
p people
p people.shift()
p people
p people.unshift('jennifer')
p people
