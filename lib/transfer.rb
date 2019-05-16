require_relative 'bank_account.rb'

class Transfer


    attr_reader :sender, :receiver, :amount
    attr_accessor :status

    #initialize with a sender and a reciever and an amount to transfer
    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = 'pending'
    end

    #checks that both accounts are valid
    def valid?
      afterTransaction = self.sender.balance - self.amount > 0
      accountAreValid = self.sender.valid? && self.receiver.valid?
      isPending = self.status == 'pending'
      return afterTransaction && accountAreValid && isPending
    end

    #each transfer only happens once
    def execute_transaction
      if valid?
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = 'complete'
      elsif !valid?
        self.status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end
    end

    #will reverse the transaction
    def reverse_transfer
      if self.status == 'complete'
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = 'reversed'
      end
    end

end
