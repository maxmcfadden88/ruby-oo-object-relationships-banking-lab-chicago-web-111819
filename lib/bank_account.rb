class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end
    def deposit(amount)
        @balance += amount
    end
    def display_balance
        p "Your balance is $#{@balance}."
    end
    def valid?
        if self.status == "open" && self.balance > 0
            return true
        else
            return false
        end
    end
    def close_account
        self.status = "closed"
    end
end