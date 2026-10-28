class Aranha {
    constructor(nome, numeroTatuado) {
        this.nome = nome;
        this.numeroTatuado = numeroTatuado;
    }
}


class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} desferiu um ataque genérico de aura contra a Aranha ${alvo.nome}!`);
    }
}


class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Intensificador) usou Punho Destruidor de Aço contra a Aranha ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Transmutador) transformou sua aura em eletricidade contra a Aranha ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Materializador) materializou sua arma de Nen contra a Aranha ${alvo.nome}!`);
    }
}


class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhasIniciais = []) {
        this.cidade = cidade;
        this.#aranhas = aranhasIniciais;
    }

    revelarAranhas() {
        console.log(`\n--- TRUPE FANTASMA EM: ${this.cidade} ---`);
        this.#aranhas.forEach(aranha => {
            console.log(`- Aranha nº ${aranha.numeroTatuado}: ${aranha.nome}`);
        });
    }

    buscarAranhas(numero) {
        return this.#aranhas.find(aranha => aranha.numeroTatuado === numero);
    }
}

const feitan = new Aranha('Feitan', 2);
const machi = new Aranha('Machi', 3);

const trupe = new TrupeFantasma('Cidade Z', [feitan, machi]);

trupe.revelarAranhas();
const alvoAranha = trupe.buscarAranhas(2);


if (alvoAranha) {
    console.log(`\n--- INÍCIO DO COMBATE CONTRA ${alvoAranha.nome} ---`);
    
    const hunters = [
        new Intensificador('Gon'),
        new Transmutador('Killua'),
        new Materializador('Kurapika')
    ];

    hunters.forEach(hunter => {
        hunter.atacar(alvoAranha);
    });
}
