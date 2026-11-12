import Control.Monad (mapM_)

pesoMaximo :: Double
pesoMaximo = 15.0


data Encomenda = Encomenda {
    destinatario :: String,
    peso         :: Double,
    frete        :: Double
} deriving (Show)

descrever :: Encomenda -> String
descrever enc = "Destinatário: " ++ destinatario enc ++ 
                " | Peso: " ++ show (peso enc) ++ "kg" ++ 
                " | Frete: R$ " ++ show (frete enc)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let listaEncomendas = [
        Encomenda { destinatario = "Ursula", peso = 5.0, frete = 30.0 },
        Encomenda { destinatario = "Ojiro", peso = 18.5, frete = 120.0 },
        Encomenda { destinatario = "Madame", peso = 12.0, frete = 80.0 },
        Encomenda { destinatario = "Padeiro", peso = 22.0, frete = 150.0 }
        ]

  putStrLn "--- Todas as Encomendas do Dia ---"
  mapM_ (putStrLn . descrever) listaEncomendas

  putStrLn "\n--- Encomendas que Cabem na Vassoura (<= 15kg) ---"
  let encomendasValidas = cabemNaVassoura listaEncomendas
  mapM_ (putStrLn . descrever) encomendasValidas

  putStrLn "\n--- Total de Fretes das Encomendas Válidas ---"
  print (totalDeFretes encomendasValidas)
