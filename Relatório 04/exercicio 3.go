package main

import "fmt"

func gerarEscalaPlantao(n int) {
	fmt.Println("\n--- Escala de Plantão Técnico ---")
	dia := 1

	for i := 1; i <= n; i++ {
		fmt.Printf("Plantão %d: Dia %d do mês\n", i, dia)
		dia = dia + 4
	}
}

func main() {
	var quantidade int

	fmt.Scanln(&quantidade)
	fmt.Println("Digite a quantidade de plantões necessários:", quantidade)

	gerarEscalaPlantao(quantidade)
}
