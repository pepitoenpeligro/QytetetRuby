# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'tipo_casilla'
require_relative 'titulo_propiedad'

module ModeloQytetet
  class Tablero
    attr_accessor :carcel
    
    private
    attr_writer :carcel, :casillas
    
    
    def initialize
      inicializar()
    end
    
    private def inicializar()
      @casillas = Array.new

      @casillas << Casilla.new(0, 10000, TipoCasilla::SALIDA, nil)
      @casillas << Casilla.new(1, 0, TipoCasilla::PARKING, nil)
      @casillas << Casilla.new(2,0, TipoCasilla::IMPUESTO, nil)
      @casillas << Casilla.new(3,0, TipoCasilla::JUEZ, nil)
      @casillas << Casilla.new(4,0, TipoCasilla::CARCEL, nil)
      
      @casillas << Casilla.new(5,0, TipoCasilla::SORPRESA, nil)
      @casillas << Casilla.new(6,0, TipoCasilla::SORPRESA, nil)
      @casillas << Casilla.new(7,0, TipoCasilla::SORPRESA, nil)
      
      @casillas << Casilla.new(8,0, nil, TituloPropiedad.new("Calle Machirulo Opresor", 50,0.2, 200, 250))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Desengaño", 50,0.2, 150, 300))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Volcá", 80,-0.2, 120, 350))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle La Sal", 100,0.2, 900, 700))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Endeble", 50,-0.12, 300, 660))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Grindr", 90,0.15, 400, 600))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Tus Ojos Bandidos", 60, 0.13, 500, 300))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Cristina La Veneno", 80,0.2, 1000, 750))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Bollera Siesa", 50,-0.14, 600, 400))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Capillita", 100,-0.2, 700, 700))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle Ofertaza", 100,1.7, 800, 750))
      @casillas << Casilla.new(9,0, nil, TituloPropiedad.new("Calle El Futuro es de las Lesbianas", 70,1.5, 500, 500))
      
      @carcel = @casillas.at(4)
      
    end
    
    
    publics
    def to_s
      return "Casillas = " << @casillas.to_s + "\t Cárcel = #{@carcel}"  << "\n"
    end
    
  end
end
