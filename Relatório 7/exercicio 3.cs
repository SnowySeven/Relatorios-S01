using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"\n--- Grimório ---");
        Console.WriteLine($"Feitiço Favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"- {Nome} ({Funcao})");
    }
}

public class Maga
{
    public string Nome { get; set; }

    public Grimorio GrimorioEspecial { get; set; }

    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.GrimorioEspecial = new Grimorio();
        this._companheiros = new List<Companheiro>();
        Console.WriteLine($"[Maga] {Nome} iniciou a sua jornada.");
    }

    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\n=== Grupo de {Nome} ===");
        Console.WriteLine($"Companheiros recrutados ({_companheiros.Count}):");
        foreach (var companheiro in _companheiros)
        {
            companheiro.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Jornada de Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.GrimorioEspecial.FeiticoFavorito = "Feitiço para criar um campo de flores";
        frieren.MostrarGrupo();
        frieren.GrimorioEspecial.Abrir();

        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}
//5. EXPLICAÇÃO DE COMPOSIÇÃO E AGREGAÇÃO NO PROGRAMA: 
//COMPOSIÇÃO (Relação Forte): 
//Acontece entre Maga e Grimorio. O objeto Grimorio é instanciado diretamente dentro
//do construtor da Maga (new Grimorio()). Isto significa que a sua vida depende estritamente
//da Maga: se a instância de Maga deixar de existir, o Grimorio deixa de existir com ela.
//AGREGAÇÃO (Relação Fraca): 
//Acontece entre Maga e Companheiro. Os objetos Companheiro (Fern, Stark) são criados 
//fora da classe Maga e depois apenas associados através do método Recrutar(). 
//Mesmo que a classe Maga seja destruída, os companheiros continuam a existir de forma
//independente na memória.
