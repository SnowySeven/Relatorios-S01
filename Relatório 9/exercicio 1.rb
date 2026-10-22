class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(novo_valor)
    if novo_valor >= 5 && novo_valor <= 200
      @_preco = novo_valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{@nome} | Preço: R$ #{@_preco}"
  end
end


class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} | Homenagem: #{lenda}"
  end
end

coquetel_comum = CoquetelAfterlife.new("Jackie Wells", 50)
drink_lenda_1  = DrinkDeLenda.new("Johnny Silverhand", 120, "Johnny Silverhand")
drink_lenda_2  = DrinkDeLenda.new("David Martinez", 90, "David Martinez")

cardapio = [coquetel_comum, drink_lenda_1, drink_lenda_2]

puts "--- CARDÁPIO DO AFTERLIFE ---"
cardapio.each do |drink|
  puts drink.ficha
end

puts "\n--- TESTANDO O SETTER DE PREÇO ---"
drink_lenda_1.preco = 500

drink_lenda_1.preco = 80

puts "\nFicha atualizada:"
puts drink_lenda_1.ficha

puts "\n--- TESTANDO ALTERAÇÃO DO NOME ---"
# drink_lenda_1.nome = "Novo Nome" # causa NoMethodError pois nome é apenas attr_reader[cite: 2, 3]
