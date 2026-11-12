data Cafe = Cafe String Double Int deriving (Show)

descrever :: Cafe -> String
descrever (Cafe nome preco _) = "Café: " ++ nome ++ " - Preço: R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido pediuLeite (Cafe _ preco _) =
  if pediuLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let cafeSuave      = Cafe "Blend Suave" 8.50 3
      cafeEquilibrado = Cafe "Mandela" 10.00 6
      cafeForte       = Cafe "Ethiopia Special" 14.50 9

  putStrLn "--- Descrições e Forças ---"
  
  putStrLn (descrever cafeSuave ++ " | Força: " ++ forca cafeSuave)
  putStrLn (descrever cafeEquilibrado ++ " | Força: " ++ forca cafeEquilibrado)
  putStrLn (descrever cafeForte ++ " | Força: " ++ forca cafeForte)

  putStrLn "\n--- Testando Pedido (com leite e sem leite) ---"
  
  putStr "Preço do "
  putStr (descrever cafeForte)
  putStr " sem leite: "
  print (precoDoPedido False cafeForte)

  putStr "Preço do "
  putStr (descrever cafeForte)
  putStr " com leite: "
  print (precoDoPedido True cafeForte)
