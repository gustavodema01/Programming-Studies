using Error_Handling.Entities.Exceptions;


namespace Error_Handling.Entities
{
    internal class Account
    {
        public int Number { get; private set; }
        public string Holder { get; private set; }
        public double Balance { get; private set; }
        public double WithdrawLimit { get; private set; }

        public Account(int number, string holder, double balance, double withdrawlimit) //construtor que obriga as variáveis a serem inicidadas
        {
            Number = number;
            Holder = holder;
            Balance = balance;
            WithdrawLimit = withdrawlimit;
        }

        public void Deposit(double amount)
        {
            Balance += amount;
        }
        public void WithDraw(double amount_)
        {
            if (amount_ > WithdrawLimit)
            {
                throw new DomainException(" The amount exceeds withdraw limit");
            }
            if (amount_ > Balance)
            {
                throw new DomainException(" Not enough balance");
            }
            Balance -= amount_;
        }
    }
}
