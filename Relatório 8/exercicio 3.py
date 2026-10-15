class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        return f"Persona: {self.nome} (Arcano: {self.arcano})"


class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome  # nome real
        self.codinome = codinome


class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recusar(self):
        pass

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.codinome} ({aliado.nome}) foi recrutado para a equipe.")

    def infiltrar(self, palacio: str):
        print(f"\n--- Infiltrando no Palácio de {palacio} ---")
        print(f"Líder {self.codinome} invade o mundo cognitivo!")
        print(f"Invoca sua Persona -> {self.persona.invocar()}")
        
        if not self._equipe:
            print("Equipe: Nenhuma aliada no momento.")
        else:
            equipe_str = ", ".join([f"{a.codinome} ({a.nome})" for a in self._equipe])
            print(f"Equipe Phantom Thieves: {equipe_str}")


if __name__ == "__main__":
    print("--- Inicializando Persona 5 ---")

    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")


# EXPLICAÇÃO DE COMPOSIÇÃO E AGREGAÇÃO NO PROGRAMA:
# - Composição: A classe 'Persona' (ex.: Arsène) é criada diretamente dentro do 
#   construtor (__init__) da classe 'Lider'. Isso significa que a Persona nasce e 
#   morre junto com o Líder; ela não existe de forma independente fora dele[cite: 5].
# - Agregação: A classe 'Aliado' é criada de forma totalmente independente no 
#   __main__, antes mesmo do Líder existir[cite: 6]. O 'Lider' apenas armazena referências 
#   desses aliados na sua lista '_equipe' através do método 'recrutar()'. Se o Líder 
#   deixar de existir, os aliados continuam a existir por conta própria[cite: 5, 6].
