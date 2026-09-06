using System;

namespace AtividadePOO4___Pessoa.Entities
{
    internal class Funcionario : Pessoa 
    {
        private double _salario; //private para não permitir que o nome seja alterado fora da classe
        public double Salario { get { return _salario; }
            set {if (value < 0)//validação para o salário ser maior que 0
                { throw new ArgumentException ("Salário inválido!"); }
                _salario = value;
            }
        }
        public Funcionario(string nome, int idade, double salario) : base(nome, idade)
        {
            Salario = salario;
        }

        public override string DevolveNome()
        {
            return base.DevolveNome().ToUpper();
        }
    }
}
