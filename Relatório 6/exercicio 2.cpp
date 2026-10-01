#include <iostream>
#include <string>
using namespace std;

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    LinkSocial link;

    link.setNome("Ryuji Sakamoto");
    link.setArcana("Chariot");
    link.setRank(1);

    cout << "=== Estado Inicial ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;
    cout << endl;

    link.subirRank();

    cout << "=== Após Subir de Rank ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank Atualizado: " << link.getRank() << endl;

    return 0;
}
