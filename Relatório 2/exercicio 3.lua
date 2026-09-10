function filtrarMaiores(tabela, limite)
    local maiores = {}
    for i = 1, #tabela do
        if limite < tabela[i] then
            table.insert(maiores, tabela[i])
        end
    end
    return maiores
end

local tabela = {}
local N = tonumber(io.read())
print ("Digite a quantidade de elementos: ".. N)
local quantidade = 0

for i = 1, N do
    local elemento = tonumber(io.read())
    table.insert(tabela, elemento)
    print("Digite o elemento " .. i .. ": " .. elemento)
end

local limite = tonumber(io.read())
print("Digite o valor limite: " .. limite)

local resultado = filtrarMaiores(tabela, limite)

print("Elementos maiores que " .. limite .. ":")

for i = 1, #resultado do
    print(resultado[i])
end
