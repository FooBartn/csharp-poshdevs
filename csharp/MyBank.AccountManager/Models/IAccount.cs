namespace MyBank.AccountManager.Models
{
    public interface IAccount
    {
        decimal Balance { get; }
        string Name { get; set; }

        IAccount Close();
        void Deposit(decimal value);
        IAccount Freeze();
        IAccount Unfreeze();
        void Withdraw(decimal value);
    }
}