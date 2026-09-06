using System;

namespace Atividade_POO
{
    internal class Funcionário
    {
        private string _nome; //private porque eles só podem serem modificados nessa classe funcionario
        private double _salarioBase; //private porque eles só podem serem modificados nessa classe funcionario
        public DateTime DataNascimento { get; set; }
        public string Nome
        {
            get  //get retorna o valor
            {
                return _nome;
            }
            set //set atualiza o valor
            {
                if (string.IsNullOrWhiteSpace(value)) //validação
                {
                    throw new ArgumentException("O nome é obrigatório."); //excessão criada por mim
                }
                _nome = value;//valor final
            }
        }

        public double SalarioBase
        {
            get
            {
                return _salarioBase;
            }
            set
            {
                if (value <= 0) //validação
                {
                    throw new ArgumentException("O salário deve ser maior que zero."); //excessão que eu criei
                }
                _salarioBase = value;
            }
        }

        public Funcionário(string nome) //construtor para a variável ser inciada obrigatóriamente.
        {
            Nome = nome;
        }
        public double SalarioLiquido(double DescontoMes) // método
        {
            return SalarioBase - DescontoMes;
        }

        public double SalarioLiquido(double DescontoMes, double Bonus)//sobrecarga do método SalarioLiquido
        {
            return SalarioLiquido(DescontoMes) + Bonus;
        }
    }
}