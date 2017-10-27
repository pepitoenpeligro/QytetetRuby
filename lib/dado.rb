# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module ModeloQytetet

  class Dado
    @@instance = nil
    
    def initialize
      
    end

    def tirar
      rand(5) + 1
    end
    
    def self.instance
      @@instance ||= new
    end

    private_class_method :new
  end
end
