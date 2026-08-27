local tabela = {}
local N = tonumber(io.read())
print ("Digite a quantidade de elementos: ".. N)
local quantidade = 0

for i = 1, N do
    local elemento = tonumber(io.read())
    table.insert(tabela, elemento)
    print("Digite o elemento " .. i .. ": " .. elemento)
end

local procura = tonumber(io.read())
print("Digite o numero X a ser buscado: " .. procura)

for i = 1, #tabela do
    if procura == tabela[i] then
        quantidade = 1 + quantidade
    else
    end
end

print("O numero " .. procura .. " aparece " .. quantidade .. " vez(es) na tabela")
