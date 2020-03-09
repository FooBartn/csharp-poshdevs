class Account {
    [string]$Name
    [decimal]$Balance

    Account([string] $Name, [string] $Balance) {
        $this.Name = $Name
        $this.Balance = $Balance
    }

    Account([Account] $Account) {
        $this.Name = $Account.Name
        $this.Balance = $Account.Balance
    }

    [decimal] GetBalance() {
        return $this.Balance
    }

    [decimal] Deposit([decimal] $Value) {
        $this.Balance += $Value
        return $this.Balance
    }

    [decimal] Withdraw([decimal] $Value) {
        if ($this.Balance -lt $Value) {
            Write-Host "You don't have enough money for that"
        }
        else {
            $this.Balance -= $Value
        }

        return $this.Balance
    }

    [Account] CloseAccount() {
        if ($this.Balance -ne 0) {
            Write-Host "Please withdraw all funds before closing your account"
            return $this
        } 
        else {
            Write-Host "We're sorry to see you go!"
        }

        return [ClosedAccount]::new($this.Name, $this.Balance)
    }

    [Account] FreezeAccount() {
        return [FrozenAccount]::new($this.Name, $this.Balance)
    }

    [Account] UnfreezeAccount() {
        Write-Host "Account has not been frozen"
        return $this
    }
}

class OpenAccount : Account {

    OpenAccount([string] $Name, [decimal] $Balance) : base($Name, $Balance) {

    }
}

class ClosedAccount : Account {

    ClosedAccount([string] $Name, [decimal] $Balance) : base($Name, $Balance) {

    }

    [decimal] GetBalance() {
        Write-Host "This account has been closed"
        return $this.Balance
    }

    [decimal] Deposit([decimal] $Value) {
        Write-Host "Unable to add funds. This account has been closed"
        return $this.Balance
    }

    [decimal] Withdraw([decimal] $Value) {
        Write-Host "Unable to remove funds. This account has been closed"
        return $this.Balance
    }

    [Account] CloseAccount() {
        Write-Host "This account has already been closed"
        return $this
    }

    [Account] FreezeAccount() {
        Write-Host "This account cannot be frozen because it is closed"
        return $this
    }

    [Account] UnfreezeAccount() {
        Write-Host "This account is not frozen. It has been closed"
        return $this
    }
}

class FrozenAccount : Account {

    FrozenAccount([string] $Name, [decimal] $Balance) : base($Name, $Balance) {

    }

    [decimal] GetBalance() {
        Write-Host "This account has been frozen"
        return $this.Balance
    }

    [decimal] Deposit([decimal] $Value) {
        Write-Host "Unable to add funds. This account has been frozen"
        return $this.Balance
    }

    [decimal] Withdraw([decimal] $Value) {
        Write-Host "Unable to remove funds. This account has been frozen"
        return $this.Balance
    }

    [Account] CloseAccount() {
        Write-Host ""
        throw "This account cannot be closed because it is frozen"
    }

    [Account] FreezeAccount() {
        Write-Host "This account has already been frozen"
        return $this
    }

    [Account] UnfreezeAccount() {
        return [OpenAccount]::new($this.Name, $this.Balance)
    }
}