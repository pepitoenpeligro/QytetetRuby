# encoding: utf-8
require_relative '../tablero.rb'

module ModeloQytetet
  
  class TableroTest
    tablero = ModeloQytetet::Tablero::new
    SEPARADOR = "\n_______________________________________________________" <<
                "____________________________________________________\n\n\n\n\n"
              
    puts "\t\t\t\t" << "[RUBY]Prueba de unidad de la clase TABLERO" << 
         "\n\n\n\n\n\n"
    
    puts "Test [esCasillaCarcel]" << "\nla casilla ¿es carcel? 6:\t" << 
      tablero.esCasillaCarcel(6).to_s << "\nla casilla ¿es carcel? 4:\t" <<
      tablero.esCasillaCarcel(4).to_s<< SEPARADOR
    
    puts "Test [getCarcel]: \n" << tablero.getCarcel().to_s << SEPARADOR
    
    puts "Test [obtenerCasillaNumero(numero)]: \n" << 
      tablero.obtenerCasillaNumero(19).to_s << SEPARADOR
    
    puts "Test [obtenerNuevaCasilla(casilla, desplazamiento)]: \n" << 
      tablero.obtenerNuevaCasilla(tablero.getCarcel(),23).to_s << SEPARADOR
    
    
  end

end
