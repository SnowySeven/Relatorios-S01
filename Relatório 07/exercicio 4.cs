using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- Entidade: {Nome} ---");
        Console.WriteLine("Uma presença cósmica manifesta-se no abismo.");
        
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem Conhecida: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"\n--- Profundo: {Nome} ---");
        Console.WriteLine("Emerge das profundezas do oceano sussurrando cânticos esquecidos.");
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine("As suas asas fungos zumbem com frequências alienígenas de Yuggoth.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
        Console.WriteLine($"[Pesquisador] {Nome} iniciou os seus estudos na Universidade Miskatonic.");
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n=== Catálogo de Relatos do Pesquisador {Nome} ===");
        Console.WriteLine($"Total de entidades registradas: {_catalogo.Count}");

        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===");

        EntidadeCosmica entidadeGenerica = new EntidadeCosmica("Aboff-Gnath");
        Profundo profundo = new Profundo("Dagon");
        MiGo migo = new MiGo("Fungi de Yuggoth");

        profundo.Origem = "Fossa das Marianas / R'lyeh";
        migo.Origem = "Yuggoth (Plutão)";

        Pesquisador pesquisador = new Pesquisador("Dr. Armitage");

        pesquisador.Catalogar(entidadeGenerica);
        pesquisador.Catalogar(profundo);
        pesquisador.Catalogar(migo);

        pesquisador.LerCatalogo();

        Console.WriteLine("\n=== Fim da Catalogação ===");
    }
}
