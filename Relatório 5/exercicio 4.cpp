#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    int matriz_solar[5][5] = {0};
    int op = 0;

    while(op != 3){
        cout << "=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;

        cin >> op;
        cout << "Escolha uma opcao: " << op << endl;
        cout << endl;

        if (op == 1){
            int f, c;
            cin >> f;
            cout << "Digite a fileira (0-4): " << f << endl;
            cin >> c;
            cout << "Digite a coluna (0-4): " << c << endl;

            if (matriz_solar[f][c] == 0){
                matriz_solar[f][c] = 1;
                cout << "Sucesso: Celula solar ativada!" << endl;
            } else {
                cout << "Erro: Celula solar ja esta em operacao!" << endl;
            }
            cout << endl;
        }
        else if (op == 2){
            cout << "--- Mapa da Matriz Solar ---" << endl;
            for (int i = 0; i < 5; i++){
                for (int j = 0; j < 5; j++){
                    cout << "[" << matriz_solar[i][j] << "]";
                    if (j < 4) cout << " ";
                }
                cout << endl;
            }
            cout << endl;
        }
    }

    int ativas = 0;
    int inativas = 0;

    for (int i = 0; i < 5; i++){
        for (int j = 0; j < 5; j++){
            if (matriz_solar[i][j] == 1){
                ativas++;
            } else {
                inativas++;
            }
        }
    }

    double percentual = (ativas / 25.0) * 100.0;

    cout << "=== RELATORIO FINAL DE OPERACAO ===" << endl;
    cout << "Total de celulas ATIVAS: " << ativas << endl;
    cout << "Total de celulas INATIVAS: " << inativas << endl;
    cout << fixed << setprecision(2);
    cout << "Capacidade Operacional: " << percentual << "%" << endl;

    return 0;
}
