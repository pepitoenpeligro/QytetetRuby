# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class TituloPropiedad
    attr_reader :nombre, :hipotecada, :alquilerBase, :factorRevalorizacion, :hipotecaBase, :precioEdificar
    attr_writer :hipotecada
    
    def initialize(n, alqBase, fRevalorizacion, hipoBase, precioEdif )
      @nombre = n
      @hipotecada = false
      @alquilerBase = alqBase
      @factorRevalorizacion = fRevalorizacion
      @hipotecaBase = hipoBase
      @precioEdificar = precioEdif
    end
    
    def to_s
      return "Titulo de Propiedad {" << "nombre de la calle = " << @nombre <<
                ",\t¿Está hipotecado? = " << @hipotecada.to_s <<
                ",\tPrecio Base a pagar = " << @alquilerBase.to_s  <<
                ",\tRevalorizacion = " << @factorRevalorizacion.to_s <<
                ",\tValor Hipoteca Base = " << @hipotecaBase.to_s <<
                ",\tPrecio Edificacion = " << @precioEdificar.to_s <<
                "}"
    end
    
  end
end 
