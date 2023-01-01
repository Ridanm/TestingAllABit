result = false 

until result 
  print 'Quieres volver a jugar: '
  result = gets.chomp
  if result == 'yes'
    puts 'Repitiendo'
    result = false 
  else 
    puts 'thanks for playing' 
    result = true 
  end
end

