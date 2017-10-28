# encoding: utf-8
require_relative 'tipo_casilla'

module ModeloQytetet
  class Casilla
    attr_reader :numeroCasilla, :coste, :numHoteles, :numCasas, :tipo, :titulo
    
    def initialize(nCasilla, coste, t, tp)
      if(tp == nil)
        SinTituloPropiedad(nCasilla, coste, t)
      else
        ConTituloPropiedad(nCasilla, coste, tp)
      end
    end
    
    private def SinTituloPropiedad(nCasilla, coste, t)
      @numeroCasilla = nCasilla;
      @coste = coste;
      @numHoteles = 0;
      @numCasas = 0;
      @tipo = t;
      @titulo = nil;
    end
    
    private def ConTituloPropiedad(nCasilla, coste, tp)
      @numeroCasilla = nCasilla;
      @coste = coste;
      @numHoteles = 0;
      @numCasas = 0;
      @tipo = TipoCasilla::CALLE;
      @titulo = tp;
    end
    
    def to_s
      comun = "Numero casilla = #{@numeroCasilla}"  << "\t" <<
              "Coste = #{@coste}"  << "\t" <<
              "Numero Hoteles = #{@numHoteles} "  << "\t" <<
              "Numero Casas = #{@numCasas}" <<  "\t"     
      if @titulo != nil
        return comun << "Titulo = #{@titulo}"
      else
         return comun << "Tipo =#{@tipo} "
      end
    end
    
    def getTipo()
      return @tipo
    end
    
    def getTitulo()
      return @titulo
    end
    
    #protected
    def asignarPropietario(jugador)
      raise NotImplementedError
    end
    
    #protected
    def calcularValorHipoteca()
      raise NotImplementedError
    end
    
    #protected
    def cancelarHipoteca()
      raise NotImplementedError
    end
    
    #protected
    def cobrarAlquiler()
      raise NotImplementedError
    end
    
    #protected
    def edificarCasa()
      raise NotImplementedError
    end
    
    #protected
    def edificarHotel()
      raise NotImplementedError
    end
    
    #protected
    def estaHipotecada()
      return @titulo.getHipotecada()
    end
    
    #protected
    def getCoste()
      return @coste
    end
    
    #protected
    def getCosteHipoteca()
      raise NotImplementedError
    end
    
    #protected
    def getNumeroCasilla()
      return @numeroCasilla
    end
    
    #protected
    def getNumCasas()
      @numCasas
    end
    
    #protected
    def getNumHoteles()
      @numHoteles
    end
    
    #protected
    def getPrecioEdificar()
      raise NotImplementedError
    end
    
    #protected
    def hipotecar()
      raise NotImplementedError
    end
    
    #protected
    def precioTotalComprar()
      raise NotImplementedError
    end
    
    #protected
    def propietarioEncarcelado()
      raise NotImplementedError
    end
    
    #protected
    def sePuedeEdificarCasa()
      raise NotImplementedError
    end
    
    #protected
    def sePuedeEdificarHotel()
      raise NotImplementedError
    end
    
    #protected 
    def setNumCasas(numeroNuevo)
      @numCasas = numeroNuevo
    end
    
    #protected
    def setNumHoteles(numeroNuevo)
      @numHoteles = numeroNuevo
    end
    
    #protected
    def soyEdificable()
      return @tipo == ModeloQytetet::TipoCasilla::CALLE
    end
    
    #protected
    def tengoPropietario()
      raise NotImplementedError
    end
    
    #protected
    def venderTitulo()
      raise NotImplementedError
    end
    
    private
    def setTitulo(titulo)
      @titulo = titulo
    end
    
    def asignarTituloPropiedad()
      raise NotImplementedError
    end
    
    
    
  end
end
