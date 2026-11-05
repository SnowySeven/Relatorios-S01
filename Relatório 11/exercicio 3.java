import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O alienígena " + nome + " abriu uma fenda espacial e disparou raios laser!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O espírito youkai " + nome + " emitiu um gemido assustador e fez os objetos flutuarem!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println("Local '" + local + "': Está tranquilo, nenhum sinal sobrenatural.");
        } else {
            System.out.print("Local '" + local + "': ");
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Alienigena alien = new Alienigena("Serena-chan");
        EspiritoYoukai youkai = new EspiritoYoukai("Turbo Granny");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Túnel Abandonado", youkai);
        mapa.registrar("Laboratório Secreto", alien);

        mapa.investigar("Túnel Abandonado");
        mapa.investigar("Laboratório Secreto");
        mapa.investigar("Escola");
    }
}
