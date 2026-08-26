using System;
using System.Collections.Generic;
using System.Globalization;
using ex2_POO.Entities.Enums;

namespace ex2_POO
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try //validação de erro
            {
                List<Jogo> list = new List<Jogo>();//cada jogo é adicionado na lista
                for (int i = 0; i < 2; i++)
                {
                    Console.Write("Código: "); //a responsabilidade de recolher as informações do usuário é do programa, não da classe
                    int codigo = int.Parse(Console.ReadLine()); ;
                    while (codigo <= 0) ; //validação para o código ser maior que 0
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("Digite um código maior que 0:");
                        Console.ResetColor();
                        codigo = int.Parse(Console.ReadLine());
                    }                  

                    Console.Write("Nome: "); //a responsabilidade de recolher as informações do usuário é do programa, não da classe
                    string nome = Console.ReadLine();

                    Console.Write("Categoria: (ACÃO: 0, LUTA: 1, TIRO: 2, ESPORTES: 3)");
                    int opcao = int.Parse(Console.ReadLine());
                    while (opcao < 0 || opcao > 3) //validação para categoria
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("Digite uma opcão válida: ");
                        Console.ResetColor();
                        opcao = int.Parse(Console.ReadLine());
                    }         
                    Categoria categoria = (Categoria)opcao;

                    Console.Write("Data de Lançamento: ");
                    DateTime dataLancamento = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    while (dataLancamento > DateTime.Now) //validação para Data de lançamento
                    { 
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("Digite uma data válida: ");
                        Console.ResetColor();
                        dataLancamento = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }                  

                    Jogo jogo = new Jogo(codigo, nome, categoria, dataLancamento); //instaciação da classe com as variáveis declaradas
                    list.Add(jogo);
                }
                foreach (Jogo game in list) //vou percorrer os itens da lista e mostrá-los
                {
                    Console.WriteLine(game);
                }

            }
            catch (Exception ex) //tratamento de erro
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"Error: {ex.Message}");
                Console.ResetColor();
            }
        }
    }
}
