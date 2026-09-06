using System;

namespace Atividade_POO
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Funcionário f = new Funcionário(); //instanciei o objeto 
                Console.Write("Nome: "); //atribui a responsabilidade de coletar os dados fora da classe
                string nome = Console.ReadLine();
                f.Nome = nome;

                Console.Write("Salário: ");
                double salario = double.Parse(Console.ReadLine());
                f.SalarioBase = salario;

                Console.Write("Data de nascimento: ");
                DateTime nascimento = DateTime.Parse(Console.ReadLine());
                f.DataNascimento = nascimento;
                
                Console.Write("Desconto do mês: ");
                double desconto = double.Parse(Console.ReadLine());
                double salarioDescontado = f.SalarioLiquido(desconto); //chamei o método e coloquei o parâmetro

                Console.Write("Bônus do mês: ");
                double bonus = double.Parse(Console.ReadLine());
                double salariofinal = f.SalarioLiquido(desconto, bonus); 

                Console.WriteLine("\nNome: " + nome +
                    "\nData de nascimento: " + nascimento +
                    "\nSalario pós desconto: " + salarioDescontado +
                    "\nSalário pós bônus: " + salariofinal);
            }
            catch (FormatException ex)
            {
                Console.WriteLine("\nMensagem de erro: " + ex.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("Mensagem de erro: " + e.Message);
            }
        }
    }
}
