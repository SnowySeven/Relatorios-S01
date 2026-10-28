class Instrumentista
    attr_reader :nome, :instrumento
  
    def initialize(nome, instrumento)
      @nome = nome
      @instrumento = instrumento
    end
  
    def interpretar(peca)
      raise NotImplementedError, "#{self.class} deve implementar o método interpretar"
    end
  end
  
  
  class Solista < Instrumentista
    def interpretar(peca)
      puts "#{nome} (#{instrumento}) executa a peça '#{peca}', conduzindo a melodia principal."
    end
  end
  
  
  class Acompanhador < Instrumentista
    def interpretar(peca)
      puts "#{nome} (#{instrumento}) toca a base da peça '#{peca}', acompanhando o ritmo do solista."
    end
  end
  

  class Regente
    attr_reader :nome, :orquestra
  
    def initialize(nome)
      @nome = nome
      @orquestra = []
    end
  
    def convocar(instrumentista)
      @orquestra << instrumentista
    end
  
    def reger(peca)
      puts "\n--- Regente #{@nome} inicia a regência da peça: '#{peca}' ---"
      @orquestra.each do |inst|
        inst.interpretar(peca)
      end
    end
  
    def escalacao
      @orquestra.map do |inst|
        "Classe: #{inst.class} | Nome: #{inst.nome} (#{inst.instrumento})"
      end
    end
  end
  
  kosei   = Solista.new("Kousei Arima", "Piano")
  kaori   = Acompanhador.new("Kaori Miyazono", "Violino")
  maestro = Regente.new("Maestro Hiroko")
  
  maestro.convocar(kosei)
  maestro.convocar(kaori)
  
  maestro.reger("Sonata para Violino e Piano No. 9 de Beethoven")
  
  puts "\n--- ESCALAÇÃO DOS MÚSICOS ---"
  maestro.escalacao.each do |texto|
    puts texto
  end
  
  
  puts "\n--- TESTE DA CLASSE BASE ---"
  musico_generico = Instrumentista.new("Takeshi", "Piano")
  
  
  puts "Objeto Instrumentista criado com sucesso"
