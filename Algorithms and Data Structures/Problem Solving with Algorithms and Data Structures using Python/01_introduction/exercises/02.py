# Construct a class hierarchy for bank accounts.


class Account:
    def __init__(self, account_holder_name, interest_rate):
        self.account_holder_name = account_holder_name
        self.interest_rate = interest_rate
        self.outstanding_deposit = 0

    def deposit(self, amount):
        self.outstanding_deposit += amount
        return self.outstanding_deposit


class CurrentAccount(Account):
    def __init__(self, account_holder_name, interest_rate):
        super().__init__(account_holder_name, interest_rate)

    def withdraw(self, amount):
        if amount > self.outstanding_deposit:
            raise ValueError("withdrawal lager than outstanding")

        self.outstanding_deposit -= amount
        return self.outstanding_deposit


class SavingAccount(Account):
    def __init__(self, account_holder_name, interest_rate):
        super().__init__(account_holder_name, interest_rate)
