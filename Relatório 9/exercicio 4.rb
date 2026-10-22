module Depoente
    def depor
      raise NotImplementedError, "#{self.class} deve implementar o método depor"
    end
  end
  
  module Detivel
    def ser_detido
      puts "#{nome} foi levado sob custódia pela Scotland Yard."
    end
  end
  
  class Envolvido
    attr_reader :nome
  
    def initialize(nome)
      @nome = nome
    end
  end
  
  class TestemunhaOcular < Envolvido
    include Depoente
  
    def depor
      puts "#{nome} (Testemunha Ocular): Vi o suspeito correndo em direção à ponte às 22h."
    end
  end
  
  class SuspeitoDoCrime < Envolvido
    include Depoente
    include Detivel
  
    def depor
      puts "#{nome} (Suspeito): Eu estava em casa jogando xadrez no horário do crime; tenho um álibi!"
    end
  end
  
  
  class Investigacao
    attr_reader :caso, :envolvidos
  
    def initialize(caso)
      @caso = caso
      @envolvidos = []
    end
  
    def registrar(envolvido)
      @envolvidos << envolvido
    end
  
    def ouvir_todos
      puts "\n--- Depoimentos do Caso: #{@caso} ---"
      @envolvidos.each do |envolvido|
        envolvido.depor
      end
    end
  
    def acionar_scotland_yard
      puts "\n--- Ação da Scotland Yard ---"
      detensiveis = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
      detensiveis.each(&:ser_detido)
    end
  end
  

  testemunha = TestemunhaOcular.new("Mrs. Hudson")
  suspeito1  = SuspeitoDoCrime.new("Lord Blackwood")
  suspeito2  = SuspeitoDoCrime.new("Irene Adler")
  
  investigacao = Investigacao.new("O Mistério do Colar Roubado")
  investigacao.registrar(testemunha)
  investigacao.registrar(suspeito1)
  investigacao.registrar(suspeito2)
  
  investigacao.ouvir_todos
  investigacao.acionar_scotland_yard
