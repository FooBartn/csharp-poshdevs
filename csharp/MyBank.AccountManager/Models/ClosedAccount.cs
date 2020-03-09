using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyBank.AccountManager.Models
{
    public class ClosedAccount : AccountBase
    {
        public ClosedAccount(string name, decimal value) : base(name, value)
        {
        }

        public override void Deposit(decimal value)
            => throw new ApplicationException("Account is closed");

        public override void Withdraw(decimal value)
            => throw new ApplicationException("Account is closed");

        public override IAccount Close()
            => this;

        public override IAccount Freeze()
            => throw new ApplicationException("Account is closed");

        public override IAccount Unfreeze()
            => throw new ApplicationException("Account is closed");
    }
}
