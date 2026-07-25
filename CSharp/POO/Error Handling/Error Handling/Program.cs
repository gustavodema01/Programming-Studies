using Error_Handling.Entities;
using System;

using System.Globalization;

namespace Error_Handling
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Enter account data");
            Console.Write("Number: ");
            int number = int.Parse(Console.ReadLine());

            Console.Write("Holder: ");
            string holder = Console.ReadLine();

            Console.Write("Initial balance: ");
            double balance = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

            Console.Write("Withdraw limit: ");
            double withdrawlimit = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            Account account = new Account(number, holder, balance, withdrawlimit);

            Console.Write("\nEnter amount for withdraw: ");
            double amount_ = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            try
            {
                account.WithDraw(amount_); //saque da conta
                Console.Write("New balance: " + account.Balance.ToString("F2", CultureInfo.InvariantCulture ));

            }
            catch (Exception e)
            {
                Console.Write("Withdraw error: " + e.Message);
            }
        }
    }
}
