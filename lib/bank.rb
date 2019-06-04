require_relative './transactions'

class Bank

  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def deposit(value)
    transactions.deposit(value)
  end

  def withdraw(value)
    transactions.withdraw(value)
  end

end
