# encoding: utf-8
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
      @casilla = nil
      @jugador
    end
    
    def to_s
      return "Titulo de Propiedad {" << "nombre de la calle = " << @nombre <<
                ",\t¿Esta hipotecado? = " << @hipotecada.to_s <<
                ",\tPrecio Base a pagar = " << @alquilerBase.to_s  <<
                ",\tRevalorizacion = " << @factorRevalorizacion.to_s <<
                ",\tValor Hipoteca Base = " << @hipotecaBase.to_s <<
                ",\tPrecio Edificacion = " << @precioEdificar.to_s <<
                ",\tcasilla = " << @casilla.to_s <<
                ",\tcasilla = " << @jugador.to_s <<
                "}"
    end
    
    #protected
    def cobrarAlquiler(coste)
      raise NotImplementedError
    end
    
    def getAlquilerBase
      return @alquilerBase
    end
    
    def getFactorRevalorizacion
      return @factorRevalorizacion
    end
    
    def getHipotecaBase
      return @hipotecaBase
    end
    
    def getNombre
      return @nombre
    end
    
    def getPrecioEdificar
      @precioEdificar
    end
    
    def propietarioEncarcelado
      raise NotImplementedError
    end
    
    def setCasilla(casilla)
      @casilla = casilla
    end
    
    def setHipotecada(hipotecada)
      @hipotecada = hipotecada
    end
    
    def setPropietario(jugador)
      @jugador = jugador
    end
    
    def tengoPropietario()
      raise NotImplementedError
    end
    
    
    
  end
end 
