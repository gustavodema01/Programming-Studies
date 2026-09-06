using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace ex1_POO
{
    internal class Program
    {
        
        static void Main(string[] args)
        {
            try 
            {
                Console.Write("Código: "); //a responsabilidade de recolher as informações do usuário é do programa, não da classe
                int codigo = int.Parse(Console.ReadLine());

                Console.Write("Nome: ");
                string nome = Console.ReadLine();

                Console.Write("Categoria: ");
                string categoria = Console.ReadLine();

                Console.Write("Data de Lançamento: ");
                DateTime dataLancamento = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", CultureInfo.InvariantCulture);

                Jogo jogo = new Jogo(codigo, nome, categoria, dataLancamento); //instaciação da classe com as variáveis declaradas
                Console.WriteLine(jogo);
            }
            catch (Exception ex) //tratamento de erro
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
