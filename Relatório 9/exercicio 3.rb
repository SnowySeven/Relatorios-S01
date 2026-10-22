class PhoneWave
    def enviar_dmail(mensagem)
      puts "D-Mail enviado para o passado! Mensagem: \"#{mensagem}\""
    end
  end
  
  
  class MembroDoLab
    attr_reader :numero, :name
  
    def initialize(numero, name)
      @numero = numero
      @name = name
    end
  end
  

  class LaboratorioDeGadgets
    attr_reader :phonewave, :membros
  
    def initialize
      @phonewave = PhoneWave.new
      @membros = []
    end

    def admitir(membro)
      @membros << membro
      puts "Lab Mem #{membro.numero}: #{membro.name} foi admitido no laboratório."
    end
  
    def experimento(mensagem)
      puts "\n--- Iniciando Experimento com D-Mail ---"
      puts "Membros presentes no laboratório:"
      
      @membros.each do |m|
        puts "- Lab Mem #{m.numero}: #{m.name}"
      end
  
      @phonewave.enviar_dmail(mensagem)
    end
  end
  
  okabe = MembroDoLab.new(1, "Rintaro Okabe")
  mayuri = MembroDoLab.new(2, "Mayuri Shiina")
  
  lab = LaboratorioDeGadgets.new
  
  lab.admitir(okabe)
  lab.admitir(mayuri)
  
  lab.experimento("Compre bananas extras antes de 12:00!")
  
  
  # ==============================================================================
  # EXPLICAÇÃO DOS CONCEITOS NESTE PROGRAMA:
  # 
  # - COMPOSIÇÃO (PhoneWave e LaboratorioDeGadgets): 
  #   O PhoneWave é instanciado diretamente dentro do initialize de 
  #   LaboratorioDeGadgets (`@phonewave = PhoneWave.new`). Ele pertence ao 
  #   laboratório; se o laboratório deixar de existir, o PhoneWave morre junto.
  # 
  # - AGREGAÇÃO (MembroDoLab e LaboratorioDeGadgets): 
  #   Os objetos `okabe` e `mayuri` foram criados no `main` antes mesmo de o 
  #   laboratório existir. Eles são passados e armazenados no array `@membros`. 
  #   Se o laboratório for destruído, os membros continuam existindo de forma 
  #   independente no escopo global.
  # ==============================================================================
