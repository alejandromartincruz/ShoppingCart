#Check if taday is weekend

def weekend_checker

time = Time.now
puts time

if time.sunday? == false
  weekend = time.saturday?
end

if time.saturday? == false
  weekend = time.sunday?
end

weekend

end

puts weekend_checker