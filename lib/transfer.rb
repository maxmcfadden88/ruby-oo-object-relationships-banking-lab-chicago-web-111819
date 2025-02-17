# require_relative 'bank_account'
require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @transfer
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction   
    if valid? && @sender.balance > @amount && self.status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer   
      if valid? && @sender.balance > @amount && self.status == 'complete' 
        @sender.balance += @amount
        @receiver.balance -= @amount
        self.status = 'reversed'
      end
  end
end