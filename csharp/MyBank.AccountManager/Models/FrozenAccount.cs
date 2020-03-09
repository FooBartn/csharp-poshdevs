using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyBank.AccountManager.Models
{
    public class FrozenAccount : AccountBase
    {
        public FrozenAccount(string name, decimal value) : base(name, value)
        {
        }

        public override void Deposit(decimal value)
            => throw new ApplicationException("Account is frozen");

        public override void Withdraw(decimal value)
            => throw new ApplicationException("Account is frozen");

        public override IAccount Freeze()
            => this;

        public override IAccount Unfreeze()
            => new OpenAccount(Name, Balance);

        public override IAccount Close()
            => throw new ApplicationException("Account is frozen");
    }
}
