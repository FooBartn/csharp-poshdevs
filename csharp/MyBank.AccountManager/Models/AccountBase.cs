using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyBank.AccountManager.Models
{
    public abstract class AccountBase : IAccount
    {
        public string Name { get; set; }
        public decimal Balance { get; private set; }

        public AccountBase(string name, decimal value)
        {
            Name = name;
            Balance = value;
        }

        public virtual void Deposit(decimal value)
            => Balance += value;

        public virtual void Withdraw(decimal value)
        {
            if (Balance < value)
                throw new ApplicationException("You don't have enough funds");

            Balance -= value;
        }

        public virtual IAccount Close()
            => new ClosedAccount(Name, Balance);

        public virtual IAccount Freeze()
            => new FrozenAccount(Name, Balance);

        public virtual IAccount Unfreeze()
            => throw new ApplicationException("Account is open");
    }
}
