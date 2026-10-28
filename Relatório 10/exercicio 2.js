class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar o método 'usarHabilidade()'`);
    }

    entrarEmCombate() {
        const habilidade = this.usarHabilidade();
        console.log(`Agente: ${this.codinome} | Pistola: ${this.#pistola.modelo} | Ação: ${habilidade}`);
    }
}


class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return "Usa fumaça para bloquear a visão dos inimigos.";
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return "Dispara uma flecha de Reconhecimento para revelar a posição inimiga.";
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return "Avança agressivamente eliminando os alvos com velocidade.";
    }
}


class Esquadrao {
    #agentes;

    constructor(nome, agentesIniciais = []) {
        this.nome = nome;
        this.#agentes = agentesIniciais;
    }

    iniciarPartida() {
        console.log(`\n--- ESQUADRÃO ${this.nome}: INICIAR PARTIDA! ---`);
        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}


const viper = new Controlador('Viper', 'Classic');
const omen  = new Controlador('Omen', 'Shorty');
const sova  = new Iniciador('Sova', 'Sheriff');
const jett  = new Duelista('Jett', 'Ghost');

const protocoloValorant = new Esquadrao('Protocolo VALORANT', [viper, omen, sova, jett]);

protocoloValorant.iniciarPartida();

console.log('\n--- CONTROLADORES DO ESQUADRÃO ---');
protocoloValorant.listarControladores().forEach(controlador => {
    console.log(`- ${controlador.codinome}`);
});


// Teste de criação direta da classe base abstrata/contrato:
// O objeto é criado, mas chamar entrarEmCombate() dispara o erro do usarHabilidade()
// const agenteGenerico = new AgenteProtocolo('Recruta', 'Classic');
// agenteGenerico.entrarEmCombate(); // Descomentar esta linha gerará um Error
