require_relative './transactions'
require_relative './print_statement'

class Bank

  attr_reader :transactions, :print

  def initialize(transactions = Transactions.new, print)
    @transactions = transactions
    @print = print
  end

  def deposit(value)
    transactions.deposit(value)
  end

  def withdraw(value)
    transactions.withdraw(value)
  end

  def print_statement
    print.pretty_print(transactions.transactions)
  end

end
