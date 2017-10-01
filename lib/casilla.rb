# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
        return comun << "Titulo = #{@titulo}"  << "\n"
      else
         return comun << "Tipo =#{@tipo} " << "\n"
      end
    end
    
    
  end
end
