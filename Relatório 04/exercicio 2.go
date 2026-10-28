package main

import "fmt"

func main() {
	var t1 int
	var t2 int
	var t3 int

	fmt.Scanln(&t1)
	fmt.Println("Digite as vendas do 1º trimestre:", t1)

	fmt.Scanln(&t2)
	fmt.Println("Digite as vendas do 2º trimestre:", t2)

	fmt.Scanln(&t3)
	fmt.Println("Digite as vendas do 3º trimestre:", t3)

	soma := t1 + t2 + t3

	if soma < 100 {
		fmt.Println("Meta mínima anual não atingida!")
	} else {
		fmt.Println("Total de vendas:", soma, "unidades")

		switch {
		case soma >= 250:
			fmt.Println("Classificação: Categoria Top Seller")
		case soma >= 180:
			fmt.Println("Classificação: Categoria Sênior")
		default:
			fmt.Println("Classificação: Categoria Pleno")
		}
	}
}
