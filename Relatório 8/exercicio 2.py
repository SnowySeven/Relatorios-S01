class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> usa a sua suprema genérica.")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> (Tanque) ativa a sua suprema defensiva!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> (Suporte) ativa a sua suprema de suporte!")

    def curar_equipa(self):
        print(f"<{self.codinome}> cura a equipa com sucesso!")


if __name__ == "__main__":
    print("--- Inicializando o Overwatch ---")

    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    mercy = HeroiSuporte("Mercy", "Suporte")

    herois: list[HeroiOverwatch] = [reinhardt, mercy]

    print("\n--- Simulação de Partida ---")
    for heroi in herois:
        heroi.usar_suprema()

        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipa()

        print("-" * 40)
