using System;


namespace AtividadePOO4___Pessoa.Entities
{
    internal class Pessoa
    {
        private string _nome; //private para não permitir que o nome seja alterado fora da classe
        public string Nome
        {
            get { return _nome; }
            set
            {
                if (string.IsNullOrEmpty(value)) //validação para a variável não ser vazia
                {
                    throw new ArgumentException("O nome é obrigatório."); //excessão criada por mim
                }
                _nome = value;
            }

        }
        private int _idade; //private para não permitir que o nome seja alterado fora da classe
        public int Idade
        {
            get { return _idade; }
            set
            {
                if (value <= 0) //validação para a variável  ser maior que 0
                {
                    throw new ArgumentException("Idade inválida");
                }
                _idade = value;
            }
        }

        public Pessoa(string nome, int idade)//construtor que obriga as variáveis a serem iniciadas
        {
            Nome = nome;
            Idade = idade;
        }

        public virtual string DevolveNome()
        {
            string[] partes = Nome.Split(' '); //separa as partes do nome a partir de um espaço(' ')
            return partes[0]; //pego o primeiro array do nome
        }
    }
}