#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    double peso;
    double carga = 0;
    int op = 0;


    cin >> peso;

    cout << "Informe a capacidade maxima de carga do drone (kg): " << peso << endl;



    while(op != 4){
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;

        cin >> op;
        cout << "Escolha uma opcao: " << op << endl;
        cout << endl;

        if (op == 1){
            cout << fixed << setprecision(2);
            cout << "Carga Atual: " << carga << " kg / " << peso << " kg" << endl;
            cout << "Espaco Disponivel: " << peso - carga << " kg" << endl;
            cout << endl;
        }
        else if(op == 2){
            double carga2;
            cin >> carga2;
            cout << "Digite o peso do pacote a ser carregado (kg): " << carga2 << endl;
            if(carga + carga2 > peso){
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao Cancelada" << endl;
                cout << endl;
            }else{
                carga += carga2;
                cout << "Pacote adicionado com sucesso!" << endl;
                cout << endl;
            }
        }
        else if(op == 3){
            double carga3;
            cin >> carga3;
            cout << "Digite o peso a ser removido (kg): " << carga3 << endl;
            carga -= carga3;
            cout << "Pacote removido com sucesso!" << endl;
            cout << endl;
        }

    }

    cout << "Encerrando sistema de telemetria" << endl;

    return 0;
}
