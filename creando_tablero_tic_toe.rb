
@board = Array.new(10)

def show_board
  col_separator, row_separator = " | ", "--+---+--"
  label_for_position = lambda{|position| @board[position] ? @board[position] : position}
  row_for_display = lambda{|row| row.map(&label_for_position).join(col_separator)}
 
  row_positions = [[1,2,3], [4,5,6], [7,8,9]]
  rows_for_display = row_positions.map(&row_for_display)
  puts rows_for_display.join("\n" + row_separator + "\n")
end

puts show_board


@arreglo = Array.new(10)
@arreglo[2] = "J"
def mostrar_tablero 
  separador_columna, separador_fila = " | ", "--+---+--" # dos variables para crear los separadores 
  etiqueta_por_posicion = lambda{ |posicion| @arreglo[posicion] ? @arreglo[posicion] : posicion} # una ternaria muestra la posición del arreglo o la posición

  fila_para_mostrar = lambda{ |fila| fila.map(&etiqueta_por_posicion).join(separador_columna)}

  posicion_por_fila = [[1,2,3], [4,5,6], [7,8,9]]
  fila_para_mostrar = posicion_por_fila.map(&fila_para_mostrar)
  puts fila_para_mostrar.join("\n" + separador_fila + "\n")
end

puts 
puts mostrar_tablero

