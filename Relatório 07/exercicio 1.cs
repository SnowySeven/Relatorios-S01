using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }

    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public virtual void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- Combatente: {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
		Console.WriteLine("=== Cerco a Minas Tirith ===");
        CombatenteDeGondor c1 = new CombatenteDeGondor("Aragorn", "Homens", "Capitão");
        CombatenteDeGondor c2 = new CombatenteDeGondor("Legolas", "Elfos", "Arqueiro");
        CombatenteDeGondor c3 = new CombatenteDeGondor("Gimli", "Anões", "Guerreiro");

        c1.Equipar("Andúril");
        c2.Equipar("Arco de Lothlórien");

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
		Console.WriteLine("\n=== Fim da Demonstração ===");

        // 5. Tentativa de alterar o Posto na Main (causa erro de compilação por ter private set)
        // c1.Posto = "Rei"; // CS0272: The property or indexer 'CombatenteDeGondor.Posto' cannot be used in this context because the set accessor is inaccessible.

    }
}
