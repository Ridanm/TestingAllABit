# Mejorar la clase 
# Verificando los datos no esten vacios 
# Los vuelos de dicho dia hora que no estén ocupados 
# La impresión del tiquet que sea más formateada 
# Además del precio del tiquet 
# Y desde que aeropuerto va a abordar 

class Vuelo

    attr_reader :fecha, :hora, :destino

    def initialize(fecha, hora, destino)
      @fecha = fecha 
      @destino = destino 
      @hora = hora 
    end

    def mostrar_vuelo
      puts "Fecha: #{@fecha} \nHora: #{@hora} \nDestino: #{destino}"
    end

end

print 'Ingrese la fecha y mes de su vuelo: '
fecha = gets.chomp 

print 'Ingrese la hora de su vuelo: '
hora = gets.chomp 

print 'Ingrese el destino: '
destino = gets.chomp.capitalize

puts "\nEl Tiquet de su vuelo: "
vuelo = Vuelo::new(fecha, hora, destino)
vuelo.mostrar_vuelo