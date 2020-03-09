using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyBank.AccountManager.Models
{
    public class OpenAccount : AccountBase
    {
        public OpenAccount(string name, decimal value) : base(name, value)
        {
        }
    }
}
