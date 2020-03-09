using MyBank.AccountManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

[assembly: InternalsVisibleTo("MyBank.AccountManager.UnitTests")]
namespace MyBank.AccountManager
{
    public class Manager
    {
        internal IAccount Account { get; private set; }

        public void OpenAccount(string name, decimal value)
        {
            Account = new OpenAccount(name, value);
        }

        public void Deposit(decimal value)
        {
            ValidateAccountExists();
            Account.Deposit(value);
        }

        public void Withdraw(decimal value)
        {
            ValidateAccountExists();
            Account.Withdraw(value);
        }

        public void Freeze()
        {
            ValidateAccountExists();
            Account = Account.Freeze();
        }

        public void Close()
        {
            ValidateAccountExists();
            Account = Account.Close();
        }

        public void Unfreeze()
        {
            ValidateAccountExists();
            Account = Account.Unfreeze();
        }

        private void ValidateAccountExists()
        {
            if (Account is null)
                throw new ApplicationException("Account does not exist");
        }
    }
}
