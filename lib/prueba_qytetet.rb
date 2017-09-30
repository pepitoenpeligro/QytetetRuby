#encoding: utf-8

require_relative 'tipo_sorpresa'
require_relative 'sorpresa'

module ModeloQytetet
  class PruebaQytetet
    
    def PruebaQytetet.inicializar_sorpresas()
      @@mazo = Array.new # Atributo de clase
      @@mazo << Sorpresa.new("Texto1", TipoSorpresa::IRACASILLA, 1)
      @@mazo << Sorpresa.new("Texto2", TipoSorpresa::PAGARCOBRAR, 2)
      @@mazo << Sorpresa.new("Texto3", TipoSorpresa::PORCASAHOTEL, 3)
      @@mazo << Sorpresa.new("Texto4", TipoSorpresa::PORJUGADOR, 4)
      @@mazo << Sorpresa.new("Texto5", TipoSorpresa::SALIRCARCEL, 5)
      @@mazo << Sorpresa.new("Texto6", TipoSorpresa::IRACASILLA, 6)
      @@mazo << Sorpresa.new("Texto7", TipoSorpresa::PAGARCOBRAR, 7)
      @@mazo << Sorpresa.new("Texto8", TipoSorpresa::PORCASAHOTEL, 8)
      @@mazo << Sorpresa.new("Texto9", TipoSorpresa::PORJUGADOR, 9)
      @@mazo << Sorpresa.new("Texto10", TipoSorpresa::SALIRCARCEL, 10)
    end
    
    def PruebaQytetet.devolverMayorCero()
      temporal = Array.new
      @@mazo.each do |carta|
        if carta.valor > 0
          temporal << carta
        end
      end
      return temporal
    end
    
    def PruebaQytetet.devolverIrACasilla()
      temporal = Array.new
      @@mazo.each do |carta|  
        if carta.tipo == TipoSorpresa::IRACASILLA
          temporal << carta
        end
      end
      return temporal
    end
    
    def PruebaQytetet.devolverTipo(tipo)
      temporal = Array.new
      @@mazo.each do |carta|
        if carta.tipo == tipo
          temporal << carta
        end
      end
      return temporal
    end
    
    def PruebaQytetet.main
      inicializar_sorpresas()
      puts "Cartas del mazo que son mayores que cero: "
      puts devolverMayorCero() << "\n"
 
      puts "Cartas del tipo Ir a Casilla: "
      puts devolverIrACasilla() << "\n"
  
      puts "Cartas del tipo Carcel: "
      puts devolverTipo(TipoSorpresa::SALIRCARCEL)
    end
  end
  
  PruebaQytetet.main
    
end

