function Write-Message([string] $Message) {
    Write-Host ""
    Write-Host -Object $Message -ForegroundColor Green
    Write-Host ""
}

function Get-Choice() {
    Write-Host "1. Open Account"
    Write-Host "2. Get Balance"
    Write-Host "3. Deposit"
    Write-Host "4. Withdraw"
    Write-Host "5. Close Account"
    Write-Host "6. Freeze Account"
    Write-Host "7. Unfreeze Account"

    Read-Host "Enter a number"
}

function Test-Account([Account] $Account) {
    if ($null -eq $Account) {
        Write-Message "You haven't opened an account yet. Try option 1"
        return $false
    }

    return $true
}

function Enter-Bank () {

    $Account = $null
    $UsingBank = $true

    while ($UsingBank) {
        
        $Choice = Get-Choice

        switch ($Choice) {
            1 {  
                $Amount = Read-Host "How much would you like to open your account with?"
                if ($null -eq $Account) {
                    $Account = [OpenAccount]::new($env:USERNAME, $Amount)
                }
                else {
                    $Account.OpenAccount($Amount)
                }
            }
            2 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Balance = $Account.GetBalance()
                    Write-Message "Your balance is $Balance"

                }
            }
            3 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Amount = Read-Host "How much would you like to deposit?"
                    $Total = $Account.Deposit($Amount)
                    Write-Message "You tried to deposit $Amount. You now have $Total"
                }
            }
            4 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Amount = Read-Host "How much would you like to withdraw?"
                    $Total = $Account.Withdraw($Amount)
                    Write-Message "You tried to withdraw $Amount. You now have $Total"
                }
            }
            5 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Account = $Account.CloseAccount()
                }
            }
            6 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Account = $Account.FreezeAccount()
                }
            }
            7 {
                if (!(Test-Account $Account)) {
                    continue
                }
                else {
                    $Account = $Account.UnfreezeAccount()
                }
            }
            Default { continue }
        }
    }

}

