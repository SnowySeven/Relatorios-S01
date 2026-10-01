#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    Banda(string n, int i, float p, int e) : nome(n), integrantes(i), potenciaSom(p), energia(e) {}

    void duelar(Banda &rival) {
        cout << nome << " entra no palco e duela contra " << rival.nome << "!" << endl;
        
        rival.energia -= potenciaSom;
    }

    void exibirStatus() {
        cout << "Banda: " << nome << endl;
        cout << " Integrantes: " << integrantes << endl;
        cout << " Potência do Som: " << potenciaSom << endl;
        cout << " Energia: " << energia << endl;
        cout << endl;
             
    }
};

int main() {
    Banda banda1("Banda 1", 4, 25.5, 100);
    Banda banda2("Banda 2", 5, 30.0, 90);

    cout << "=== Status Inicial ===" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();
    cout << endl;

    banda1.duelar(banda2);
    cout << endl;

    cout << "=== Status Após o Duelo ===" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}
