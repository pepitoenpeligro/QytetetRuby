#encoding :UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet
  class Tablero
    attr_reader :carcel, :casillas
    def initialize
      inicializar
    end
    
    def es_casilla_carcel(numeroCasilla)
      if @casillas.at(numeroCasilla).tipo == TipoCasilla::CARCEL
        return true
      else
        return false
      end      
    end
    
    def obtener_casilla_numero(numeroCasilla)
      return @casillas.at(numeroCasilla)
    end
    
    def obtener_nueva_casilla(casilla, desplazamiento)
      numero_casilla = casilla.numeroCasilla
      numero_casilla = (numero_casilla + desplazamiento) % @casillas.length
      
      return @casillas.at(numero_casilla) 
    end
    
    def inicializar
      @casillas = Array.new
      
      i = 0
      titulos_calles = Array.new
      
      titulos_calles << TituloPropiedad.new("Calle Machirulo Opresor", 50,0.2, 200, 250)
      titulos_calles << TituloPropiedad.new("Calle Desengaño", 50,0.2, 150, 300)
      titulos_calles << TituloPropiedad.new("Calle Volcá", 80,-0.2, 120, 350)
      titulos_calles << TituloPropiedad.new("Calle La Sal", 100,0.2, 900, 700)
      titulos_calles << TituloPropiedad.new("Calle Endeble", 50,-0.12, 300, 660)
      titulos_calles << TituloPropiedad.new("Calle Grindr", 90,0.15, 400, 600)
      titulos_calles << TituloPropiedad.new("Calle Tus Ojos Bandidos", 60, 0.13, 500, 300)
      titulos_calles << TituloPropiedad.new("Calle Cristina La Veneno", 80,0.2, 1000, 750)
      titulos_calles << TituloPropiedad.new("Calle Bollera Siesa", 50,-0.14, 600, 400)
      titulos_calles << TituloPropiedad.new("Calle Capillita", 100,-0.2, 700, 700)
      titulos_calles << TituloPropiedad.new("Calle Ofertaza", 100,1.7, 800, 750)
      titulos_calles << TituloPropiedad.new("Calle El Futuro es de las Lesbianas", 70,1.5, 500, 500)
      
      
      @casillas << Casilla.iniciar_casilla(0, TipoCasilla::SALIDA)
      @casillas << Calle.new(1, 400, titulos_calles[i])
      i += 1
      @casillas << Calle.new(2, 360, titulos_calles[i])
      i+= 1
      @casillas << Calle.new(3, 380, titulos_calles[i])
      i+= 1
      @casillas << Calle.new(4, 300, titulos_calles[i])
      i+= 1
      @casillas << Casilla.iniciar_casilla(5, TipoCasilla::CARCEL)
      @carcel = @casillas.at(5)
      @casillas << Casilla.iniciar_casilla(6, TipoCasilla::SORPRESA)
      @casillas << Calle.new(7, 500, titulos_calles[i])
      i+= 1
      @casillas << Calle.new(8, 490, titulos_calles[i])
      i+= 1
      @casillas << Calle.new(9, 400, titulos_calles[i])
      i+= 1
      @casillas << Casilla.iniciar_casilla(10, TipoCasilla::IMPUESTO)
      @casillas << Calle.new(11, 550, titulos_calles[i])
      i+= 1
      @casillas << Casilla.iniciar_casilla(12, TipoCasilla::SORPRESA)
      @casillas << Calle.new(13, 600, titulos_calles[i])
      i+= 1
      @casillas << Casilla.iniciar_casilla(14, TipoCasilla::PARKING)
      @casillas << Casilla.iniciar_casilla(15, TipoCasilla::JUEZ)
      @casillas << Calle.new(16, 550, titulos_calles[i])
      i+= 1
      @casillas << Calle.new(17, 700, titulos_calles[i])
      i+= 1
      @casillas << Casilla.iniciar_casilla(18, TipoCasilla::SORPRESA)
      @casillas << Calle.new(19, 790, titulos_calles[i])
    end
        
    def to_s
      "Tablero: \n Casillas: #{@casillas} \n Cárcel: #{@carcel}"
    end
        
    private :inicializar
  end
end
