class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    #initialize bank account with a name, a set balance and a status of open
    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    #add money to the account
    def deposit(num)
        self.balance += num
    end

    #display the currect balance
    def display_balance
        return "Your balance is $#{self.balance}."
    end

    #bank account is valid if status is open and balance is more than $0
    def valid?
        return self.status == 'open' && self.balance > 0
    end

    #close account
    def close_account
        self.status = 'closed'
    end

end
