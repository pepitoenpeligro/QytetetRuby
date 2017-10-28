# encoding: utf-8

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
