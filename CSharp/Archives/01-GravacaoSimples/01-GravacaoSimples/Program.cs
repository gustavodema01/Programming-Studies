using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _01_GravacaoSimples
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<string> name = new List<string>();
            string path = @"c:\temp\arquivos.txt";
            for (int i = 0; i < 3; i++)
            {
                Console.Write($"Digite o {i} nome: ");
                string nome = Console.ReadLine();
                name.Add(nome); //adiciono os nomes na lista
            }

            try
            {
                using (StreamWriter fs = File.AppendText(path))//streamwriter para abrir o arquivo
                    foreach (string names in name)
                    {
                        fs.WriteLine(names); //escrevo cada nome como uma linha do arquivo
                    }
                using (StreamReader sr = File.OpenText(path)) //streamreader para a leitura 
                {
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(line);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error: {e}");
            }
        }
    }
}

