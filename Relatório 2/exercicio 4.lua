function calcularMedia(a, b)
    local m = (a + b) / 2
    return m
end

function encontrarMaior(a, b)
    if a > b then
        local maior = a
        return a
    else
        local maior = b
        return b
    end
end

function calcularDiferencaAbsoluta(a, b)
    local diferenca = a - b
    if diferenca < 0 then
        local diferencaAb = diferenca * -1
        return diferencaAb
    else
        return diferenca
    end
end

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        local resultado = calcularMedia(n1, n2)
        return resultado
    end
    if operacao == "maior" then
        local resultado = encontrarMaior(n1, n2)
        print("EncontrarMaior = " ..  resultado)
        return resultado
    end
    if operacao == "diferenca" then
        local resultado = calcularDiferencaAbsoluta(n1, n2)
        return resultado
    end
end

local a = tonumber(io.read())
local b = tonumber(io.read())
local op = io.read()


local resultado = analisarNumeros(a, b, op)
print("Resultado: " .. resultado)
