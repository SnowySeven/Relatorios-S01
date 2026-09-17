#include <iostream>
#include <iomanip>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho){
    float confiabilidade = probabilidades[0];
    for(int i = 1; i < tamanho; i++){
        confiabilidade *= probabilidades[i];
    }
    return confiabilidade;
}

int main()
{
    int n;

    cin >> n;

    cout << "Digite a quantidade de componentes do sistema: " << n << endl;

    float probabilidades[n];

    for(int i = 0; i < n; i++){
        cin >> probabilidades[i];
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): " << probabilidades[i] << endl;
    }

    float resultado = calcular_confiabilidade_sistema(probabilidades, n);

    cout << endl;
    cout << "Confiabilidade total do sistema: " << resultado << " (" << resultado * 100 << "%)" << endl;

    return 0;
}
