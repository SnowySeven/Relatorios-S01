class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }
    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} sofreu dano! Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} realizou um ataque genérico!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Hidro-Bomba!`);
        alvo.sofrerDano(20);
    }
}


class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Cipó!`);
        alvo.sofrerDano(15);
    }
}

const meuSquirtle = new Squirtle('SquirtleShow', 100);
const meuBulbasaur = new Bulbasaur('Bulba', 30);

meuBulbasaur.atacar(meuSquirtle);

meuSquirtle.atacar(meuBulbasaur);
meuSquirtle.atacar(meuBulbasaur);

console.log(`\n--- FIM DAS BATALHAS ---`);
console.log(`Vida de ${meuSquirtle.apelido}: ${meuSquirtle.vida}`);
console.log(`Vida de ${meuBulbasaur.apelido}: ${meuBulbasaur.vida}`);


// Tentando imprimir o #vida de um dos Pokémon diretamente no main:
// console.log(meuSquirtle.#vida); // SyntaxError: Private field '#vida' must be declared in an enclosing class
