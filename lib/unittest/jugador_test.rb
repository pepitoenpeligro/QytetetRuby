# encoding: utf-8

module ModeloQytetet
  require_relative '../tipo_sorpresa'
  require_relative '../sorpresa'
  require_relative '../tipo_casilla'
  require_relative '../titulo_propiedad'
  require_relative '../casilla'
  require_relative '../tablero'
  require_relative '../jugador'
  class JugadorTest
    j = Jugador.new()
    puts j.obtenerCapital
   
    puts "Hola jugador"
    
    
  end
end
