using AtividadePOO4___Pessoa.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadePOO4___Pessoa
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Digite o nome: ");
            string nome = Console.ReadLine();

            Console.Write("Digite a idade: ");
            int idade = int.Parse(Console.ReadLine());
            Pessoa p = new Pessoa(nome, idade);

            Console.Write("Salário: ");
            double salario = Convert.ToDouble(Console.ReadLine());
            Console.Write("\nPrimeiro nome: ");
            Console.WriteLine(p.DevolveNome());

            Funcionario f = new Funcionario(nome, idade, salario);
            Console.Write("Primeiro nome em maiusculo: ");
            Console.WriteLine(f.DevolveNome());
        }
    }
}
