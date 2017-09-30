#encoding: utf-8
module ModeloQytetet
  
  # definicion de la clase Sorpresa
  class Sorpresa
    attr_reader :texto, :tipo, :valor
    
    # attr_reader equivale a:
    #def texto
    # return @texto
    #end
    
    def initialize(txt, t, v)
      @texto = txt
      @tipo = t
      @valor = v
    end
    
    def to_s
      return "Sorpresa {" + "texto = #{@texto}"  +  ",\ttipo = #{@tipo}" + ",\tvalor = #{@valor}" + "}\n";
    end
  end
  
end
