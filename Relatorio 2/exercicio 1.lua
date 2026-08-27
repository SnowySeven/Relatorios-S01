function gerarTabelaPotencias(inicio, fim, base)

    for i = inicio, fim do
        local resultado = base ^ i
        print(base .. " ^ " .. i .. " = " .. resultado)
    end
end

local n1 = tonumber(io.read())
local n2 = tonumber(io.read())
local n3 = tonumber(io.read())

local conta = gerarTabelaPotencias(n1, n2, n3)
