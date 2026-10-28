using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nível {Nivel}) ---");
        Console.WriteLine($"{Especie} usou um ataque comum!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nível {Nivel}) ---");
        Console.WriteLine($"{Especie} usou um golpe próprio de Planta: Chicote de Cipó!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"...e depois soltou uma descarga elétrica potente!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibição Pokémon ===");

        List<Pokemon> listaPokemon = new List<Pokemon>
        {
            new Pokemon("Eevee", 5),
            new TipoPlanta("Bulbasaur", 12),
            new TipoEletrico("Pikachu", 15)
        };

        foreach (var pokemon in listaPokemon)
        {
            pokemon.Atacar();
        }

        Console.WriteLine("\n=== Fim da Batalha ===");
    }
}
