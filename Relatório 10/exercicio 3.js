class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de Perigo: ${this.nivelDePerigo}`;
    }
}


class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const novaFicha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(novaFicha);
    }

    exibirFichas() {
        console.log(`\n--- DIÁRIO MISTERIOSO Nº ${this.numero} ---`);
        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}


class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}


class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- CABANA DO MISTÉRIO (Dono: ${this.dono}) ---`);
        console.log("Funcionários em serviço:");
        this.#funcionarios.forEach(func => {
            console.log(`- ${func.nome} (${func.cargo})`);
        });
    }
}

const meuDiario = new DiarioMisterioso(3);
meuDiario.anotar('Gnomo', 'Baixo');
meuDiario.anotar('Demônio Triangular (Bill Cipher)', 'Extremo');
meuDiario.anotar('Zumbi', 'Médio');

meuDiario.exibirFichas();

const dipper = new Funcionario('Dipper Pines', 'Investigador de Mistérios');
const mabel = new Funcionario('Mabel Pines', 'Atendente de Souvenirs');

const cabana = new CabanaDoMisterio('Tio-Avô Stan');
cabana.contratar(dipper);
cabana.contratar(mabel);

cabana.abrirAsPortas();


//Explicação dos conceitos de Composição e Agregação no programa:
/*
  EXPLICAÇÃO DOS CONCEITOS:
  - Composição (DiarioMisterioso e FichaDeCriatura): As instâncias de FichaDeCriatura 
    são criadas diretamente de dentro do método 'anotar()' do DiarioMisterioso. Elas 
    fazem parte do diário e dependem dele para existirem no contexto do sistema (nascem 
    e morrem junto com o diário).
  - Agregação (CabanaDoMisterio e Funcionario): Os funcionários (dipper e mabel) 
    foram criados de forma independente *antes* da CabanaDoMisterio existir. Eles 
    são passados e agregados à cabana pelo método 'contratar()', o que significa que 
    eles já existiam por conta própria e continuariam existindo mesmo se a cabana deixasse de existir.
*/
