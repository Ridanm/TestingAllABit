require 'colorize'

# grade = 'F'

# did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
#   when 'A' then "Hell yeah!"
#   when 'D' then "Don't tell your mother."
#   else "'YOU SHALL NOT PASS!' -Gandalf"
# end

# puts did_i_pass

# puts 

# hash_colors = {
#   1 => '  1  '.colorize(:color => :white, :background => :red),
#   2 => '  2  '.colorize(:color => :white, :background => :blue),
#   3 => '  3  '.colorize(:color => :black, :background => :green),
#   4 => '  4  '.colorize(:color => :black, :background => :yellow),
#   5 => '  5  '.colorize(:color => :white, :background => :light_magenta),
#   6 => '  6  '.colorize(:color => :black, :background => :light_cyan)
# }

# puts hash_colors[1] 

# array_colors = [
#   '  1  '.colorize(:color => :white, :background => :red),
#   '  2  '.colorize(:color => :white, :background => :blue),
#   '  3  '.colorize(:color => :black, :background => :green),
#   '  4  '.colorize(:color => :black, :background => :yellow),
#   '  5  '.colorize(:color => :white, :background => :light_magenta),
#   '  6  '.colorize(:color => :black, :background => :light_cyan)
# ]

# puts 
# array_colors.each_with_index do |color, ind|
#   puts color
# end

# puts 
# puts array_colors[0]
# compara = gets.chomp

# puts compara
# devuelve = case compara
#            when '1' then '  1  '.colorize(:color => :white, :background => :red)
#            when '2' then '  2  '.colorize(:color => :white, :background => :blue)
#            when '3' then '  3  '.colorize(:color => :black, :background => :green)
#            when '4' then '  4  '.colorize(:color => :black, :background => :yellow)
#            when '5' then '  5  '.colorize(:color => :white, :background => :light_magenta)
#            when '6' then '  6  '.colorize(:color => :black, :background => :light_cyan)
#            end 

# puts 'DESPUÉS DEL CASE: '
# puts array_colors[0] == devuelve 
# puts array_colors[1] == devuelve 
# puts array_colors[2] == devuelve 
# puts array_colors[3] == devuelve 
# puts array_colors[4] == devuelve 
# puts array_colors[5] == devuelve 

# puts "Probando until: "
# turns = 0 

# until turns == 12
#   turns += 1
#   puts turns 
# end

# puts 
# puts 'Probando código aleatorio y coincidencias.'
# player_arr = [1, 2, 3, 4]
# comp_arr = [5, 2, 1, 4]
# comp_arr_2 = [4, 2, 3, 4]
# comp_arr_3 = [1, 3, 3, 4]
# comp_arr_4 = [1, 2, 3, 4]

# guardar_coincidencia = [' ', ' ', ' ', ' ']
# aciertos = ['a', 'b', 'c', 'd']

# comparar = comp_arr_3.each_with_index do |num, ind| 
#   player_arr.each_with_index do |elem, pos|
#     #puts "Interno player"
#     #puts "Computer: ind: #{ind} num: #{num}, Player: ind: #{pos} num: #{elem}"
#     if ind == pos && num == elem 
#       guardar_coincidencia[ind] = num 
#     else 
#       #puts 'No hay conincidencias...'
#     end
#   end
# end

# puts comparar 
# p guardar_coincidencia
# aciertos.replace(guardar_coincidencia)

# puts "Aciertos: #{aciertos}"
# puts "COINCIDENCIA DE AMBOS ARREGLOS: #{player_arr == comp_arr_4}"

# puts 
# vueltas = 0
# string_vacio = [' ','3', '4', ' ']
# player_compare = ['1', '3', '4', '4']

# until !string_vacio.include?(' ') || vueltas == 3 # mientras incluya espacios en el array o las vueltas no sean igual a 1
#   string_vacio.each_with_index do |elem, ind|
#     if elem == ' ' 
#       puts 'STRING VACIO'
#       puts ind
#       ingresar = gets.chomp 
#       string_vacio[ind] = ingresar
#       puts string_vacio == player_compare
#     else
#       puts 'No Modificar'
#       puts ind 
#     end
#   end
#     vueltas += 1
# end

# # until vueltas == 4
# #   vueltas += 1
# #   puts vueltas 
# # end

# puts "Array: #{string_vacio}"
# puts 'Game Over!!!'



# Pseudocódigo para comparar los colores de mastermind
  # 1- Un arreglo player de 4 números
  # 2- El rival computador con 12 turnos debe adivinar los 4 números,
  #    los números a elegir van del 1 al 6
  # 3- Comparar los números del computador con los del player,
  #    si al comporar coincide en número y índ  ice mantener guardar,                     
  #    ese número he índice, si los números están en el arreglo player,
  #    pero en lo posición incorrecta dor una pista y el cmmputador debe 
  #    usar ese número en otra posición en el prócimo turno.
  # 4- Volver al paso 2 adivina nueva combinación guardado si hay coincidencias,
  #    aumentar el contador en 1
  # 5- Si hay coincidencia de todos los números y índices CODE BROKEN 
  # 6- Si llegamos a 12 turnos GAME OVER 

player_arr = ['1', '2', '3', '4']

computer_guess = ['6', '5', '4', '2']

aciertos = Array.new(4, ' ') # Dicho array guarda los hits aciertos para mostrar como retroalimentación 

probabilidades = Array.new(4, '')

def comparar(computer_guess, player_arr, aciertos)
  computer_guess.each_with_index do |col, ind| # Comparamos cada número del cmputador con todas las posicioners de player_arr
    player_arr.each_with_index do |elem, pos|
      # puts "C: #{col} P: #{elem} #{computer_guess[ind] == player_arr[pos]}" # Si incluye alguno de los números dime el índice y número
      if computer_guess[ind] == player_arr[pos]
        if col == elem && ind == pos # si coincide índice y número guradalos en aciertos array 
          aciertos[ind] = 'O'.colorize(:color => :light_black)
        elsif player_arr.include?(col) # Si está en el array pero en la pasición incorrecta en el indice de computer white
          aciertos[ind] = 'O'.colorize(:color => :white)
        end
      end
    end
  end
end

# Evitando los números ya adivinados 
# Desde el cual implementamos el algoritmo de pista para el computador
# y mostrar los hits(aciertos)
def hits(aciertos, probabilidades, computer_guess)
  white_ind = 0
  not_included = 0
  colores_a_probar = ['1', '2', '3', '4', '5', '6']
  
  aciertos.each_with_index do |elem, ind|
    probabilidades[ind] = computer_guess[ind]
    if elem.include?(' ') 
      p aciertos[ind] = 'Not include'
      # En los indices que contienen un espacio vacio 
      # debe probar las referencias white 
      # Los índices con white deben incluir ese número en dicho índice
      # en la proxima adivinanza de código 
      # Si no hay aciertos la próxima vez debemos cambiar los números del 1 al 6
      not_included = ind 
    elsif elem.include?('O'.colorize(:color => :white))
      p aciertos[ind] = 'white'
      white_ind = ind
      # Los aciertos con white deben ser incluidos en los índices con espacios en blanco
      # o en su defecto cambiados de índice entre sí 
      # En colores de prueba debemos eliminar los colores que no están incluidos 
      probabilidades[not_included] = colores_a_probar.sample 
    end
  end
  puts "| #{aciertos.join(' | ')} |" # hits
end

comparar(computer_guess, player_arr, aciertos)
hits(aciertos, probabilidades, computer_guess)
p probabilidades