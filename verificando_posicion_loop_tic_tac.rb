=begin    
  Bolque para verificar si la posición en el tablero está ocupada o libre
array = [0, 1, 'x', 3, 4, 5, 6, 7, 8, 9]

# p array[0].class 
# p array[2].class 
# p ''.class 
@long = array.size - 1

# Elejir un número con verificación de lugar ocupado
while @long > 1
  @retri = false
  until @retri 
    puts "Elige un número de 1 a 9"
    position = gets.chomp.to_i
    if position.between?(1, 9) && array[position].class != ''.class 
      puts array[position] = 'x' 
      @long -= 1
      @retri = true
      p @long 
    else 
      puts "casillero ocupado !!!"
    end
  end
end
 
p array
p @long 

# p 'javascript'[0..2]
# p 4 != 4
# if 5 
#   puts "Hello thruty"
# end

# # loop do end 
# hp = 30
# loop do 
#   hp -= 2
#   puts "Damage done, hp remaining #{hp}"
#   break if hp <= 0
# end
# puts "Game Over"

=end


# Usar LINES como índices para verificar los lugares ocupados en dichas 
# posiciones en el tablero 
# Si hay tres de estos índices consecutivos con la misma letra tenemos 
# un ganador
# Bloque para verificar si hay tres en línea en el tablero 
# LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

 @board = [0, 'x', 'x', '0', 'x', 'z', 'j', 'x', 'o', 'o']


# def player_has_won? player
#   LINES.any? do |line|
#     puts "-- \n#{line.all? {|pos| @board[pos] == player}}"
#   end
# end

# player_has_won? 'x'

# puts @board[7..9].all?{|n| n == 'o'}
#['x', 'j', 'x'].all? {|pos| puts pos.is_a?(String)}
def board_full? board 
  (1..9).all? {|pos| board[pos].is_a?(String) }
end

puts board_full? @board 

col_separator = "--+---+--"
puts col_separator.size*2 