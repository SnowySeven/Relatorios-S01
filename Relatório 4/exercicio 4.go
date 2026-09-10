package main

import "fmt"

func validarIngresso(setor string, codigo int) bool {
	if setor == "VIP" {
		if codigo == 2026 {
			return true
		}
	}
	return false
}

func main() {
	var setor string
	var codigo int

	for {
		fmt.Scanln(&setor)
		fmt.Println("Digite o setor do ingresso:", setor)

		fmt.Scanln(&codigo)
		fmt.Println("Digite o código do ingresso:", codigo)

		if validarIngresso(setor, codigo) {
			fmt.Println("Acesso liberado à área VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor inválido. Tente novamente.")
		}
	}
}
