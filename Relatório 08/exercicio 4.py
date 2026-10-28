from abc import ABC, abstractmethod

class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"Netrunner <{self.nome}> usando o cyberdeck '{self.cyberdeck.modelo}' está a quebrar o gelo (ICE) de um servidor.")


class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone de vigilância <{self.codigo}> está a interceptar o sinal da rede.")


class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self._membros = membros

    def iniciar_ataque(self):
        print(f"\n--- Célula Hacker: {self.nome} iniciou o ataque ---")
        for membro in self._membros:
            membro.executar_invasao()


if __name__ == "__main__":
    print("--- Inicializando Cyberpunk: Night City ---")

    # Tentativa de instanciar a interface diretamente (comentado para o código rodar)
    # unidade_falha = IUnidadeDeRede() 
    # Erro gerado: TypeError: Can't instantiate abstract class IUnidadeDeRede without an implementation for abstract method 'executar_invasao'

    netrunner_v = OperadorNetrunner("V", "Militech Berserk")
    drone_spider = DroneDeVigilancia("Drone-01")

    celula_main = CelulaHacker("Edgerunners", [netrunner_v, drone_spider])

    celula_main.iniciar_ataque()
