import Control.Monad (mapM_)

data Etapa = NaFila | NoBanho | Concluido deriving (Show, Eq)

data Atendimento = Atendimento {
    cliente :: String,
    servico :: String,
    valor   :: Double,
    etapa   :: Etapa
} deriving (Show)

descrever :: Atendimento -> String
descrever a = "Cliente: " ++ cliente a ++ 
              " | Serviço: " ++ servico a ++ 
              " | Valor: R$ " ++ show (valor a) ++ 
              " | Etapa: " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos = sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let atendimentosOriginal = [
        Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas medicinais", valor = 500.0, etapa = NaFila },
        Atendimento { cliente = "Sem-Rosto (Kaonashi)", servico = "Banho completo com essências", valor = 350.0, etapa = NoBanho },
        Atendimento { cliente = "Aogaeru", servico = "Limpeza rápida", valor = 150.0, etapa = NaFila }
        ]
  let atendimentosAtualizados = [ concluir (atendimentosOriginal !! 0), 
                                  atendimentosOriginal !! 1, 
                                  concluir (atendimentosOriginal !! 2) ]

  putStrLn "--- Lista Original ---"
  mapM_ (putStrLn . descrever) atendimentosOriginal
  putStrLn ("Valor arrecadado (Original): R$ " ++ show (arrecadado atendimentosOriginal))

  putStrLn "\n--- Lista Nova (Com alguns atendimentos concluídos) ---"
  mapM_ (putStrLn . descrever) atendimentosAtualizados
  putStrLn ("Valor arrecadado (Atualizada): R$ " ++ show (arrecadado atendimentosAtualizados))

  putStrLn "\n--- Verificando Imutabilidade ---"
  putStrLn "A lista original permanece inalterada:"
  mapM_ (putStrLn . descrever) atendimentosOriginal
  putStrLn ("Valor arrecadado na original continua: R$ " ++ show (arrecadado atendimentosOriginal))
