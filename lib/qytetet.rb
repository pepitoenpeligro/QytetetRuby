#encoding: utf-8

module ModeloQytetet
  require 'singleton'
  require_relative 'sorpresa'
  require_relative 'tablero'
  require_relative 'sorpresa'
  require_relative 'metodo_salir_carcel'
  require_relative 'dado'
  class Qytetet
      
    include Singleton
    
    MAX_JUGADORES = 4
    MAX_CARTAS = 10
    MAX_CASILLAS = 20
    PRECIO_LIBERTAD = 2000
    SALDO_SALIDA = 1000
    
    attr_reader :mazo, :carta_actual, :jugador_actual
    
    public
    def initialize
      @cartaActual
      @mazo = Array.new
      @jugadores = Array.new
      @jugadorActual
      @dado = ModeloQytetet::Dado.instance
      inicializarTablero()
    end
    
    def aplicarSorpresa()
      #raise NotImplementedError
      return 100
    end
    
    def cancelarHipoteca(casilla)
      raise NotImplementedError
    end
    
    def comprarTituloPropiedad()
      raise NotImplementedError
    end
    
    def edificarCasa(casilla)
      raise NotImplementedError
    end
    
    def edificarHotel(casilla)
      raise NotImplementedError
    end
    
    def getCartaActual()
      return @cartaActual
    end
    
    def getJugadorActual()
      return @jugadorActual
    end
    
    def hipotecarPropiedad(casilla)
      raise NotImplementedError
    end
    
    def inicializarJuego(nombres)
      raise NotImplementedError
    end
    
    def intentarSalirCarcel()
      raise NotImplementedError
    end
    
    def jugar()
      raise NotImplementedError
    end
    
    def obtenerRanking()
      raise NotImplementedError
    end
    
    def propiedadesHipotecadasJugador(hipotecadas)
      casillasPropiedad = Array.new
      
      for i in 0..@jugadorActual.obtenerPropiedadesHipotecadas(hipotecadas).length
        casillasPropiedad << @jugadorActual.obtenerPropiedadesHipotecadas(hipotecadas).at(i).getCasilla()
      end
       
      return casillasPropiedad

    end
    
    def siguienteJugador()
      for i in 0..@jugadores.length
        if(@jugadores.at(i) == @jugadorActual)
          return @jugadores.at((i + 1) %  MAX_JUGADORES)
        end
      end
    end
    
    def venderPropiedad(casilla)
      raise NotImplementedError
    end
    
    private 
    def encarcelarJugador()
      raise NotImplementedError
    end
    
    def inicializarCartasSorpresa()
      @mazo << Sorpresa.new("Texto1", TipoSorpresa::IRACASILLA, 1)
      @mazo << Sorpresa.new("Texto2", TipoSorpresa::PAGARCOBRAR, 2)
      @mazo << Sorpresa.new("Texto3", TipoSorpresa::PORCASAHOTEL, 3)
      @mazo << Sorpresa.new("Texto4", TipoSorpresa::PORJUGADOR, 4)
      @mazo << Sorpresa.new("Texto5", TipoSorpresa::SALIRCARCEL, 5)
      @mazo << Sorpresa.new("Texto6", TipoSorpresa::IRACASILLA, 6)
      @mazo << Sorpresa.new("Texto7", TipoSorpresa::PAGARCOBRAR, 7)
      @mazo << Sorpresa.new("Texto8", TipoSorpresa::PORCASAHOTEL, 8)
      @mazo << Sorpresa.new("Texto9", TipoSorpresa::PORJUGADOR, 9)
      @mazo << Sorpresa.new("Texto10", TipoSorpresa::SALIRCARCEL, 10)
    end
    
    def inicializarJugadores(nombres)
      for i in range nombres.length
        @jugadores << Jugador.new(nombres.at(i))
      end
    end
    
    def inicializarTablero()
      @tablero = Tablero.new
    end
    
    def salidaJugadores()
      for i in 0..@jugadores.length
        @jugadores.at(i).setCasillaActual(0)
        
        @jugadores.at(i).setSaldo(7500)
      end
      
      @jugadorActual = @jugadores.at(rand(MAX_JUGADORES))
    end
    
    def getJugadores()
      return @jugadores
    end
    
    
    
    
    
  end
end
