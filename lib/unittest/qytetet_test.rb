# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
    juego = Qytetet.instance
    
    puts juego.aplicarSorpresa    
  end
end
