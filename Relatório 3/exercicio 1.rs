use std::io;

fn main() {
    let inferior = 1;
    let superior = 999;
    
    for c in inferior..=superior {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");
        
        let texto = entrada.trim();
        let mut maiusculas = 0;
        let mut numeros = 0;
        
        if texto.len() == 7 {
            for c in texto.chars() {
                if c.is_ascii_uppercase() {
                    maiusculas += 1;
                }
                if c.is_digit(10) {
                    numeros += 1;
                }
            }
        }
        
        if maiusculas == 3 {
            if numeros == 4 {
                println!("Placa cadastrada no sistema!");
                return;
            } else {
                println!("Placa invalida. Tente novamente!");
            }
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
