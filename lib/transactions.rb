class Transactions

  attr_reader :balance, :transactions

  TIME = Time.now.strftime("%d/%m/%y")

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(value)
    balance_plus(value)
    record_transaction(value)
  end

  def withdraw(value)
    raise "Unable to action request" if @balance < value

    balance_subtract(value)
    record_transaction(value)
  end

private

  def record_transaction(value)
    transaction = Time.now.strftime('%d/%m/%y'), value, @balance
    @transactions.push(transaction)
  end

  def balance_plus(value)
    @balance += value
  end

  def balance_subtract(value)
    @balance -= value
  end

end
