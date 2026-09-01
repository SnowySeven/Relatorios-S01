use std::io;

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let placa = entrada.trim();

        if placa.len() == 7 {
            let mut eh_valida = true;
            let mut i = 0;

            for c in placa.chars() {
                if i < 3 {
                    if !c.is_ascii_uppercase() {
                        eh_valida = false;
                    }
                } else {
                    if !c.is_digit(10) {
                        eh_valida = false;
                    }
                }
                i += 1;
            }

            if eh_valida {
                println!("Placa cadastrada no sistema!");
                break;
            }
        }

        println!("Placa invalida. Tente novamente!\n");
    }
}
