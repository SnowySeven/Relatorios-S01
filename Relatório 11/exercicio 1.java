abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Olá, sou o mago " + getNome() + " e meu feitiço principal é " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {
    
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Olá, sou " + getNome() + ", o demônio do fogo, e sou eu quem faz o castelo andar!");
    }
}

public class Main {
    public static void main(String[] args) {
        Morador morador1 = new Mago("Howl", "Pacto com demônio do fogo");
        Morador morador2 = new DemonioDoFogo("Calcifer");

        morador1.apresentar();
        morador2.apresentar();

        /*
         * Morador m = new Morador("Genérico");
         */
    }
}
