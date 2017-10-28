# encoding: utf-8

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
      return @propiedades.length != 0
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
      carta = @cartaLibertad
      @cartaLibertad = nil
      return carta
    end
    
    #protected
    def irACarcel(casilla)
      raise NotImplementedError
    end
    
    #protected 
    def modificarSaldo(cantidad)
      @saldo += cantidad
    end
    
    #protected
    def obtenerCapital()
      capital = @saldo
      for i in @propiedades.length
        precioEdificarHotelyCasa = @propiedades.at(i).getCasilla().getPrecioEdificar()
        costeBase = @propiedades.at(i).getCasilla().getCoste()
        numCasas = @propiedades.at(i).getCasilla().getNumCasas();
        numHoteles = @propiedades.at(i).getCasilla().getNumHoteles()
        
        if(!@propiedades.at(i).getHipotecada())
          capital += costeBase * (numCasas + numHoteles)

        else
          capital -= costeBase * (numCasas + numHoteles);
        end
      end
      return capital;
    end
    
    #protected 
    def obtenerPropiedadesHipotecadas(hipotecada)
      hipotecadas = Array.new
      noHipotecadas = Array.new
      
      for i in 0..@propiedades.length
        if(@propiedades.at(i).isHipotecada())
          hipotecadas << @propiedades.at(i)
        else
          noHipotecadas << @propiedades.at(i)
        end
      end
      
      if(hipotecada)
        return hipotecadas
      else
        return noHipotecadas
      end

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
      return esDeMiPropiedad(casilla) && !casilla.getTitulo().isHipotecada()
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
      return @cartaLibertad != nil
    end
    
    #protected
    def venderPropiedad(casilla)
      raise NotImplementedError
    end
    
    private 
    def cuantasCasasHotelesTengo()
      numCasas = 0
      numHoteles = 0
      
      for i in 0..@propiedades.length
        numCasas += @propiedades.at(i).getCasilla().numCasas
        numHoteles += @propiedades.at(i).getCasilla().numHoteles 
      end
      
      return numCasas + numHoteles
    end
    
    private
    def eliminarDeMisPropiedades(casilla)
      @propiedades.delete(casilla.getTitulo());
    end
    
    private
    def esDeMiPropiedad(casilla)
      for i in 0..@propiedades.length
        if(casilla.getTitulo == @propiedades.at(i))
          return true
        end
      end
      
      return false
    end

    private 
    def tengoSaldo(cantidad)
      raise NotImplementedError
    end
    
    public 
    def setSaldo(cantidad)
      @saldo = cantidad
    end
 
   end
end
