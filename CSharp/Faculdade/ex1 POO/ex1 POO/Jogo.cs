using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ex1_POO
{
    internal class Jogo
    {

        public int Codigo { get; private set; } // o private permite que a váriavel só seja mudada dentro da classe
        public string Nome { get; private set; }
        public string Categoria { get; private set; }
        public DateTime DataLancamento { get; private set; }

        public Jogo(int codigo, string nome, string categoria, DateTime dataLancamento) //construtor para obrigar as variáveis a serem iniciadas
        {
            Codigo = codigo;
            Nome = nome;
            Categoria = categoria;
            DataLancamento = dataLancamento;
        }

        public override string ToString()
        {
            Console.Clear();
            return $"\nCódigo: {Codigo}\n Nome: {Nome}\n Categoria: {Categoria}\n Data de lançamento: {DataLancamento:dd/MM/yyyy}";
        }

    }
}
