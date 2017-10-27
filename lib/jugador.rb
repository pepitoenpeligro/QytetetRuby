# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Jugador
    
    def initialize
      @encarcelado = false
      @nombre = ""
      @saldo = 0
      @cartaLibertad = nil
      @casillaActual = nil
      @propiedades = Array.new
    end
    
    def getCasillaActual()
      return @casillaActual
    end
    
    def getEncarcelado()
      return @encarcelado
    end
    
    
    def tengoPropiedades()
      raise NotImplementedError
    end
    
    #protected
    def actualizarPosicion(casilla)
      raise NotImplementedError
    end
    
    #protected
    def comprarTitulo()
      raise NotImplementedError
    end
    
    #protected
    def devolverCartaLibertad()
      raise NotImplementedError
    end
    
    #protected
    def irACarcel(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def modificarSaldo()
      raise NotImplementedError
    end
    
    #protected
    def obtenerCapital()
      raise NotImplementedError
    end
    
    #protected 
    def obtenerPropiedadesHipotecadas(hipotecada)
      raise NotImplementedError
    end
    
    #protected 
    def pagarCobrarPorCasaYHotel(cantidad)
      raise NotImplementedError
    end
    
    #protected 
    def pagarLibertad(cantidad)
      raise NotImplementedError
    end
    
    #protected 
    def puedoEdificarCasa(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def puedoHipotecar(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def puedoPagarHipoteca(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def puedoPagarHipoteca(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def puedoVenderPropiedad(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def setCartaLibertad(carta)
      @cartaLibertado = carta
    end
    
    #protected
    def setCasillaActual(casilla)
      @casillaActual = casilla
    end
    
    #protected
    def setEncarcelado(encarcelado)
      @encarcelado = encarcelado
    end
    
    #protected
    def tengoCartaLibertad()
      raise NotImplementedError
    end
    
    #protected
    def venderPropiedad(casilla)
      raise NotImplementedError
    end
    
    private 
    def cuentasCasasHotelesTengo()
      raise NotImplementedError
    end
    
    private
    def eliminarDeMisPropiedades(casilla)
      raise NotImplementedError
    end
    
    private
    def esDeMiPropiedad(casilla)
      raise NotImplementedError
    end
    
    private 
    def tengoSaldo(cantidad)
      raise NotImplementedError
    end
 
   end
end
