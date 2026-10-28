use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("--- Numeros no intervalo terminados em {} ---", digito);
    for i in limite_inferior..=limite_superior {
        if i % 10 == digito {
            println!("{}", i);
        }
    }
}

fn main() {
    let mut entrada1 = String::new();
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada1).expect("Erro ao ler");
    let digito: i32 = entrada1.trim().parse().unwrap_or(0);

    let mut entrada2 = String::new();
    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada2).expect("Erro ao ler");
    let limite_inferior: i32 = entrada2.trim().parse().unwrap_or(0);

    let mut entrada3 = String::new();
    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada3).expect("Erro ao ler");
    let limite_superior: i32 = entrada3.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
