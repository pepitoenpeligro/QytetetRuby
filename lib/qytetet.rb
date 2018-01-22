#encoding :UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "singleton"


module ModeloQytetet
  class Qytetet
    include Singleton
    attr_reader :cartaActual, :jugadorActual, :jugadores
    @@MAX_JUGADORES = 4
    @@MAX_CARTAS = 10
    @@MAX_CASILLAS = 20
    @@PRECIO_LIBERTAD = 200
    @@SALDO_SALIDA = 1000
    
    def initialize
      @dado = Dado.instance
      @cartaActual = nil
    end
    
    def aplicar_sorpresa
      tiene_propietario = false
      
      if (@cartaActual.tipo == TipoSorpresa::PAGARCOBRAR)
        cantidad = @cartaActual.valor
        @jugadorActual.modificar_saldo(cantidad)        
      elsif (@cartaActual.tipo == TipoSorpresa::IRACASILLA)
        numero_casilla = @cartaActual.valor
        es_carcel = @tablero.es_casilla_carcel(numero_casilla)
        
        if (es_carcel)
          encarcelar_jugador          
        else
          nueva_casilla = @tablero.obtener_casilla_numero(numero_casilla)
          tiene_propietario = @jugadorActual.actualizar_posicion(nueva_casilla)
        end        
      elsif (@cartaActual.tipo == TipoSorpresa::PORCASAHOTEL)
        cantidad = @cartaActual.valor
        @jugadorActual.pagar_cobrar_por_casa_y_hotel(cantidad)        
      elsif (@cartaActual.tipo == TipoSorpresa::PORJUGADOR)
        @jugadores.each do |jugador|
          if (jugador != @jugadorActual)
            cantidad = @cartaActual.valor
            jugador.modificar_saldo(-cantidad)
            @jugadorActual.modificar_saldo(cantidad)
          end
        end      
      elsif (@cartaActual.tipo == TipoSorpresa::CONVERTIRME)
        pos = 0
        long = @jugadores.length
        
        # Cambiar la clase del jugador actual dentro del array
        for i in 0..long
          if (@jugadorActual == @jugadores.at(i))
            pos = i
          end
        end
        
        @jugadorActual = @jugadorActual.convertirme(@cartaActual.valor)
        @jugadores[pos] = @jugadorActual
      end
      
      if (@cartaActual.tipo == TipoSorpresa::SALIRCARCEL)
        @jugadorActual.carta_libertad = @cartaActual        
      else
        @mazo << @cartaActual
      end
      
      return tiene_propietario
    end
    
    def cancelar_hipoteca(casilla)
      puedo_cancelar = false
      
      if (casilla.soy_edificable)
        se_puede_cancelar = casilla.esta_hipotecada

        
        if (se_puede_cancelar)
          puedo_cancelar = @jugadorActual.puedo_pagar_hipoteca(casilla)

          if (puedo_cancelar)
            coste_cancelar = casilla.cancelar_hipoteca
            @jugadorActual.modificar_saldo(-coste_cancelar)
          end
        end
      end
      
      return puedo_cancelar
    end
    
    def comprar_titulo_propiedad(casilla)
      puedo_comprar = @jugadorActual.comprar_titulo
      return puedo_comprar
    end
    
    def edificar_casa(casilla)
      puedo_edificar = false
      
      if (casilla.soy_edificable)
        se_puede_edificar = casilla.se_puede_edificar_casa(@jugadorActual.factorEspeculador)
        
        if (se_puede_edificar)
          puedo_edificar = @jugadorActual.puedo_edificar_casa(casilla)
          
          if (puedo_edificar)
            coste_edificar_casa = casilla.edificar_casa
            @jugadorActual.modificar_saldo(-coste_edificar_casa)
          end
        end
      end
      
      return puedo_edificar
    end
    
    def edificar_hotel(casilla)
      puedo_edificar = false
      soy_edificable = casilla.soy_edificable
      
      if (soy_edificable)
        se_puede_edificar = casilla.se_puede_edificar_hotel(@jugadorActual.factorEspeculador)
        
        if (se_puede_edificar)
          puedo_edificar = @jugadorActual.puedo_edificar_hotel(casilla)
          
          if (puedo_edificar)
            coste_edificar_hotel = casilla.edificar_hotel
            @jugadorActual.modificar_saldo(-coste_edificar_hotel)
          end
        end
      end
      
      return puedo_edificar
    end
    
    def hipotecar_propiedad(casilla)
      puedo_hipotecar = false
      if (casilla.soy_edificable)
        se_puede_hipotecar = !casilla.esta_hipotecada
        
        if (se_puede_hipotecar)
          puedo_hipotecar = @jugadorActual.puedo_hipotecar(casilla)
          
          if (puedo_hipotecar)
            cantidad_recibida = casilla.hipotecar
            @jugadorActual.modificar_saldo(cantidad_recibida)
          end
        end
      end
      
      return puedo_hipotecar
    end
    
    def inicializar_juego(nombres)
      inicializar_tablero
      inicializar_cartas_sorpresa
      inicializar_jugadores(nombres)
      salida_jugadores
    end
    
    def intentar_salir_carcel(metodo)
      libre = false
      
      if (metodo == MetodoSalirCarcel::TIRANDODADO)
        valor_dado = @dado.tirar
        libre = valor_dado > 5
        
      else
        cantidad = @@PRECIO_LIBERTAD
        tengo_saldo = @jugadorActual.pagar_libertad(cantidad)
        libre = tengo_saldo
      end
      
      if (libre)
        @jugadorActual.encarcelado = false
      end
      
      return libre
    end
    
    def jugar
      valor_dado = @dado.tirar
      
      casilla_posicion = @jugadorActual.casilla_actual
      nueva_casilla = @tablero.obtener_nueva_casilla(casilla_posicion, valor_dado)
      tiene_propietario = @jugadorActual.actualizar_posicion(nueva_casilla)
      
      if (!nueva_casilla.soy_edificable)
        if (nueva_casilla.tipo == TipoCasilla::JUEZ)
          encarcelar_jugador
          
        elsif (nueva_casilla.tipo == TipoCasilla::SORPRESA)
          @cartaActual = @mazo.at(0)
          @mazo.delete_at(0)
        end
      end
      
      return tiene_propietario
    end
    
    def obtener_ranking
      ranking = {}
      
      jugadores = @jugadores.sort { |j1,j2| j2.obtener_capital - j1.obtener_capital }
      
      jugadores.each do |jugador|
        capital = jugador.obtener_capital
        ranking[jugador.nombre] = capital
      end
      
      return ranking      
    end
    
    def propiedades_hipotecadas_jugador(hipotecadas)
      casillas = Array.new
      propiedades = @jugadorActual.obtener_propiedades_hipotecadas(hipotecadas)
      
      for item in @tablero.casillas
        for aux in propiedades
          if (aux == item.titulo)
            casillas << item
          end
        end
      end
      
      return casillas
    end
    
    def siguiente_jugador
      pos = 0
      long = @jugadores.length
      
      for i in 0..long
        if (@jugadorActual == @jugadores.at(i))
          pos = i
        end
      end
      
      @jugadorActual = @jugadores.at((pos + 1) % long)
      
      return @jugadorActual
    end
    
    def vender_propiedad(casilla)
      puedo_vender = false
      
      if (casilla.soy_edificable)
        puedo_vender = @jugadorActual.puedo_vender_propiedad(casilla)
      
        if (puedo_vender)
          @jugadorActual.vender_propiedad(casilla)
        end
      end      
      
      return puedo_vender
    end
    
    def encarcelar_jugador
      if (!@jugadorActual.tengo_carta_libertad)
        carcel = @tablero.carcel
        @jugadorActual.ir_a_carcel(carcel)
        
      else
        carta = @jugadorActual.devolver_carta_libertad
        @mazo << carta
      end
    end
    
    def inicializar_cartas_sorpresa
      @mazo = Array.new

      @mazo << Sorpresa.new("Tu casero te ha robado todo el dinero (y más) de tu fianza. Sales de la carcel por muerto de hambre." , 0, TipoSorpresa::SALIRCARCEL)
      @mazo << Sorpresa.new("Pompino te toca el culo. Sales corriendo hasta la casilla 7", 7, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("El Six Colours está lleno de capillitas. Te vas indignada hasta la casilla 19", 19, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Te ponen La Reina del Grindr en La Sal. Ganas 450€", 450, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Te has liado con un capillita machirulo opresor.Vas a la cárcel", @tablero.carcel.numeroCasilla, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Samu te roba hummus. Pierdes 300€", -300, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Vas a la sal con los alcoholicos. Los invitas a cervezas y gastas 60.", 125, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Tus amigos te roban el movil y no puedes pagar con el contactless. Te dan 100€", -100, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("La Chunga y La Hierbas tiran un muro de carga. Pagas 100€ por cada Casa y 150 por cada Hotel" , -20, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Te has peleado con la Hierbas y te vas al Hostal Loli. Pagas 200€ por cada Casa/Hotel", 15, TipoSorpresa::PORCASAHOTEL)
    end
    
    def inicializar_jugadores(nombres)
      if (nombres.length < 2 || nombres.length > @@MAX_JUGADORES)
        raise ArgumentError, "Número incorrecto de jugadores."
      end
      
      @jugadores = Array.new
      
      for jugador in nombres
        @jugadores << Jugador.new(jugador)
      end
    end
    
    def inicializar_tablero
      @tablero = Tablero.new
    end
    
    def salida_jugadores
      for jugador in @jugadores
        jugador.casilla_actual = @tablero.obtener_casilla_numero(0)
      end
      
      @jugadorActual = @jugadores.at(rand(@jugadores.length))
    end
    
    def to_s
      "QYTETET\n Carta Actual: #{@cartaActual}\n Mazo: #{@mazo.to_s}\n Jugadores: " + @jugadores.to_s + "\n Jugador Actual: #{@jugadorActual.to_s}\n Tablero #{@tablero}\n Dado #{@dado.to_s}"
    end
    
    def self.SALDO_SALIDA
      return @@SALDO_SALIDA
    end
    
    private :inicializar_cartas_sorpresa, :inicializar_jugadores, :inicializar_tablero
  end
end
