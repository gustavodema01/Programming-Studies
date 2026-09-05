using System;
using System.Collections.Generic;

namespace Atividade_POO
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool validacao = false;
            List<Funcionário> lista = new List<Funcionário>(); //instanciação de funcionários em lista

            while (!validacao)
            {
                Console.WriteLine("CADASTRO DE FUNCIONÁRIOS");
                Console.WriteLine("1. CADASTRAR");
                Console.WriteLine("2. LISTAR");
                Console.WriteLine("3. SAIR");
                Console.Write("Qual opção deseja?: ");
                try
                {
                    int opcao = int.Parse(Console.ReadLine());

                    switch (opcao)
                    {
                        case 1:
                            CadastrarFuncionarios(lista);
                            break;

                        case 2:
                            ListarFuncionarios(lista);
                            break;

                        case 3:
                            Console.Clear();
                            Console.WriteLine("Saindo...");
                            validacao = true;
                            break;

                        default:
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Opção inválida!");
                            Console.ResetColor();
                            break;
                    }
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
        static void CadastrarFuncionarios(List<Funcionário> list)
        {
            Console.Clear();
            Console.Write("Quantidade de funcionários: ");
            int qtd = int.Parse(Console.ReadLine());

            while (qtd + list.Count > 100 || qtd <= 0) //validação de funcionários
            {
                Console.Write("QUANTIDADE INVÁLIDA, TENTE NOVAMENTE: ");
                qtd = int.Parse(Console.ReadLine());
            }

            for (int i = 0; i < qtd; i++)
            {
                Console.WriteLine($"\nFuncionário {i + 1}");
                Console.Write("Nome: "); //atribui a responsabilidade de coletar os dados fora da classe
                string nome = Console.ReadLine();
                Funcionário f = new Funcionário(nome);

                Console.Write("Salário: ");
                double salario = double.Parse(Console.ReadLine());
                f.SalarioBase = salario;

                Console.Write("Data de nascimento: ");
                DateTime nascimento = DateTime.Parse(Console.ReadLine());
                f.DataNascimento = nascimento;

                Console.Write("Desconto do mês: ");
                double desconto = double.Parse(Console.ReadLine());
                f.SalarioLiquido(desconto);

                Console.Write("Bônus do mês: ");
                double bonus = double.Parse(Console.ReadLine());
                f.SalarioLiquido(desconto, bonus);

                list.Add(f);
            }
            Console.Clear();
        }
        static void ListarFuncionarios(List<Funcionário> list)
        {
            Console.Clear();
            foreach (Funcionário func in list)
            {
                Console.Write(func);
                Console.WriteLine();
            }
            Console.WriteLine("Clique qualque tecla para voltar ao menu");
            Console.ReadKey();
            Console.Clear();
        }
    }
}