using FluentAssertions;
using MyBank.AccountManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace MyBank.AccountManager.UnitTests
{
    public class ManagerTests
    {
        [Theory]
        [InlineData("Sarah", 1000000)]
        [InlineData("Max", 10)]
        [InlineData("Jack", 200)]
        [InlineData("Betty", 300)]
        public void ShouldReturn_OpenAccount(string name, decimal value)
        {
            var manager = new Manager();
            manager.OpenAccount(name, value);

            manager.Account.Should().NotBeNull();
            manager.Account.Name.Should().Be(name);
            manager.Account.Balance.Should().Be(value);
            manager.Account.Should().BeOfType<OpenAccount>();
        }

        [Fact]
        public void ShouldReturn_ClosedAccount()
        {
            var manager = new Manager();
            manager.OpenAccount("Sarah", 0);
            manager.Close();

            manager.Account.Should().NotBeNull();
            manager.Account.Should().BeOfType<ClosedAccount>();
        }

        [Fact]
        public void ShouldThrow_ClosedException()
        {
            var manager = new Manager();
            manager.OpenAccount("Sarah", 0);
            manager.Close();

            Action act = () => manager.Withdraw(100);

            act.Should().Throw<ApplicationException>().WithMessage("Account is closed");
        }
    }
}
