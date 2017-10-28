# encoding: utf-8

module ModeloQytetet
  require_relative '../tipo_sorpresa'
  require_relative '../sorpresa'
  require_relative '../tipo_casilla'
  require_relative '../titulo_propiedad'
  require_relative '../casilla'
  require_relative '../tablero'
  require_relative '../jugador'
  require_relative '../qytetet'
  class QytetetTest
    
    
    SEPARADOR = "\n_______________________________________________________" <<
                "____________________________________________________\n\n\n\n\n"
              
    puts "\t\t\t\t" << "[RUBY]Prueba de unidad de la clase Qytetet" << 
         "\n\n\n\n\n\n" 
       
    juego = Qytetet.instance
    
    jugadores = Array.new
    jugadores << "Paqui"
    jugadores << "Juan"
    jugadores << "Samu"
    jugadores << "Elisa"
    jugadores << "Ana:pi"
    
    #juego.inicializarJugadores(jugadores)
    
    puts juego.inspect
       
       
  end
end
