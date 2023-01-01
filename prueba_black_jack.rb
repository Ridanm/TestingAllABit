# def devolviendo_algo(value)
#   return 10 if ['J', 'Q', 'K'].include?(value)
#   return 11 if value == 'A'
#   return value 
# end

# puts devolviendo_algo("J")
# puts devolviendo_algo("K")
# puts devolviendo_algo("Q")
# puts devolviendo_algo("A")
# puts devolviendo_algo(2)

# Clase carta 
class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit, @value = suit, value 
  end

  def value # Este método define el valor para las cartos con figuras
    return 10 if ['J', 'Q', 'K'].include?(@value)
    return 11 if @value == 'A'
    return @value 
  end

  def to_s # este método es necesario para que devuelva el valor y figura en luagar de la clase y el número de identificación
    "#{@value} #{@suit}"
  end
end

# seis_corazones = Card.new('corazones', 6)
# puts seis_corazones 

# Creando el mazo de cartas 
class Deck 
  attr_reader :cards 

  def initialize 
    @cards = []
    build_cards
  end

  def take! 
    @cards.shift
  end

  def build_cards 
    ['Corazones', 'Espadas', 'Treboles', 'Diamantes'].each do |suit|
      (2..10).each do |number|
        @cards << Card.new(suit, number)
      end
      ['A', 'Q', 'J', 'K'].each do |face|
        @cards << Card.new(suit, face)
      end
    end
    @cards.shuffle! # Mezclamoz las cartas, asi el retirar la primera no siempre sale la misma
  end
  private :build_cards
end


# Representando las manos 
class Hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck 
    @cards = []
  end

  def hit! # pedir una carta 
    @cards << @deck.take! # desde la clase deck (mazo) 
  end

  def value # determinar el valor que tienen las cartas pedidas
    sum = 0
    @cards.each do |card| 
      sum += card.value
    end
    sum 
  end

  def to_s 
    str = ""
    @cards.each do |card|
      str += "#{card} "
    end
    str.strip 
  end
end


# IMPLEMENTANDO LA LÓGICA 
deck = Deck.new # creamos el mazo de cartas
dealer = Hand.new(deck) # creamos los jugadores 
player = Hand.new(deck)

player.hit! # repartimos las cartas
player.hit!
dealer.hit! 

puts "Repartidor: #{dealer}"
puts "Jugador:    #{player}"

puts "Tu turno: "
while player.value <= 21
  print " Carta (c) o te plantas (p) "
  option = gets.chomp 
  if option == 'c' 
    player.hit!
    puts "#{player}"
  elsif option == 'p'
    break
  end
end


if player.value <= 21
  puts "\nTurno del repartidor: "
  while dealer.value < 17 
    dealer.hit!
    puts "#{dealer}"
  end
end 

puts "\nGanador: " 
if player.value > 21 
  puts "Has perdido"
elsif  dealer.value > 21
  puts "Has Ganado"
elsif player.value == dealer.value
  puts "Han empatado"
elsif player.value > dealer.value 
  puts "Has Ganado :)"
else 
  puts "Has Perdido :("
end