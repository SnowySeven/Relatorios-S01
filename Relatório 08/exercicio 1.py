class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")


class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        status_pai = super().mostrar_status()
        return f"{status_pai} | Milagre: {self.milagre}"


if __name__ == "__main__":
    print("--- Inicializando o Exercício Dark Souls ---")

    petrus = Clerigo("Petrus", 2000, 5, "Cura")
  
    print(petrus.mostrar_status())

    print("\n--- Testando Setter de Estus ---")
    petrus.set_estus(15)
    petrus.set_estus(10)

    print(petrus.mostrar_status())

    # Erro gerado: 'Clerigo' object has no attribute '__estus' (devido ao name mangling)
