account1 = BankAccount.create(balance: Money.new(1000))
account2 = BankAccount.create(balance: Money.new(500))

TransferMoneyBetweenBankAccountsService.call(from: account1, to: account2, money: Money.new(300))

BankAccountMoneyTransfer.create(from: account1, to: account2, money: Money.new(300))
