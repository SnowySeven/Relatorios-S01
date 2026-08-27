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

print("Elementos maiores que " .. limite .. ":")

for i = 1, #tabela do
    if limite < tabela[i] then
        print(tabela[i])
    else
    end
end
