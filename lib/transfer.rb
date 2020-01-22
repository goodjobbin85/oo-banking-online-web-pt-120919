class Transfer
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, status="pending", amount) 
    @sender = sender 
    @receiver = receiver 
    @status = status 
    @amount = amount 
  end 
  
  def valid? 
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction 
    if self.status != "complete"
      if self.valid? && sender.balance > amount
        receiver.deposit(amount)
        sender.balance -= amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
        
      end 
    end
  end  
  
  def reverse_transfer 
  end
  
end
