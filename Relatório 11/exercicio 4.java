import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fervido com ervas subterrâneas até virar uma gelatina consistente.";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Desenterrada com cuidado, fatiada e assada com especiarias.";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome + " | Panela de: " + panela.getMaterial());
        System.out.println("--- Ingredientes preparados ---");
        for (Monstro m : ingredientes) {
            System.out.println("Monstro: " + m.getNome() + " | Modo de preparo: " + m.receita());
        }
    }
}

/* 
 * Explicação de Composição e Agregação no código:
 * 
 * - Composição (Cozinheiro e Panela): A panela é instanciada diretamente dentro do 
 *   construtor de Cozinheiro (`new Panela(...)`). Ela depende do cozinheiro para existir.
 * 
 * - Agregação (Cozinheiro e Monstro): Os monstros (Slime e Mandragora) são criados 
 *   externamente e adicionados à lista através de um método. Eles possuem um ciclo 
 *   de vida independente do cozinheiro.
 */

public class Main {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Gelatinoso");
        Mandragora mandragora = new Mandragora("Mandragora Screamer");

        Cozinheiro laios = new Cozinheiro("Laios", "Ferro Batido");
        laios.adicionarIngrediente(slime);
        laios.adicionarIngrediente(mandragora);

        laios.servirBanquete();
    }
}
