import Control.Monad (mapM_)

data Esboco = Esboco {
    titulo :: String,
    tecnica :: String,
    horas :: Int
} deriving (Show)

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno está vazio."
esbocoMaisRecente (e:_) = "Título: " ++ titulo e ++ " | Técnica: " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno1 = [
        Esboco { titulo = "Ruína Sombria", tecnica = "nanquim", horas = 4 },
        Esboco { titulo = "Criatura da Noite", tecnica = "carvão", horas = 3 },
        Esboco { titulo = "Floresta Nebulosa", tecnica = "grafite", horas = 2 }
        ]

  putStrLn "--- Dados do Caderno 1 ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno1)
  putStrLn ("Número de esboços: " ++ show (contarEsbocos caderno1))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno1) ++ "h")

  putStrLn "\n--- Testando com Caderno Vazio ---"
  putStrLn ("Mais recente (vazio): " ++ esbocoMaisRecente [])

  let novoEsboco = Esboco { titulo = "Olhos na Escuridão", tecnica = "nanquim", horas = 1 }
  let caderno2 = novoEsboco : caderno1

  putStrLn "\n--- Dados do Caderno 2 (com novo esboço na frente) ---"
  putStrLn ("Caderno 1 - Mais recente: " ++ esbocoMaisRecente caderno1 ++ " | Total: " ++ show (contarEsbocos caderno1))
  putStrLn ("Caderno 2 - Mais recente: " ++ esbocoMaisRecente caderno2 ++ " | Total: " ++ show (contarEsbocos caderno2))
