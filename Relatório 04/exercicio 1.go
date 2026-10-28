package main

import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Código de rastreio registrado no sistema!"
	}
	return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	var codigo string
	status := false

	for status == false {
		fmt.Print("Digite o código de rastreio: ")
		fmt.Scanln(&codigo)

		st, msg := ValidarCodigoRastreio(codigo)
		status = st
		fmt.Println(msg)
	}
}
