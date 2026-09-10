use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let diferenca = palpite - numero_secreto;
    if diferenca <= 5 {
        if diferenca >= -5 {
            true
        } else {
            false
        }
    } else {
        false
    }
}

fn main() {
    let numero_secreto: i32 = 42;
    let inferior = 1;
    let superior = 999;
    
    for c in inferior..=superior {
        let mut entrada = String::new();
        println!("Digite seu palpite:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");
        
        let palpite: i32 = entrada.trim().parse().unwrap_or(0);
        
        if acertou_o_alvo(palpite, numero_secreto) {
            println!("Parabens, voce acertou o alvo!");
            let mut distancia = palpite - numero_secreto;
            if distancia < 0 {
                distancia = -distancia;
            }
            println!("Voce ficou a apenas {} unidade(s) do numero secreto ({}).", distancia, numero_secreto);
            return;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}
