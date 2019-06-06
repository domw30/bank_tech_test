class Transactions

  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize(time = Time)
    @time = time
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(value)
    balance_plus(value)
    record_deposit(value)
    @transactions.last
  end

  def withdraw(value)
    raise "Unable to action request" if @balance < value

    balance_subtract(value)
    record_withdraw(value)
    @transactions.last
  end

private

  def record_deposit(value)
    transaction = {
      date: @time.now.strftime('%d/%m/%y'),
      credit: '%.2f' % value,
      debit: '------',
      balance: '%.2f' % @balance
    }

    @transactions.push(transaction)
  end

  def record_withdraw(value)
    transaction = {
      date: @time.now.strftime('%d/%m/%y'),
      credit: '------',
      debit: '%.2f' % value,
      balance: '%.2f' % @balance
    }
    @transactions.push(transaction)
  end

  def balance_plus(value)
    @balance += value
  end

  def balance_subtract(value)
    @balance -= value
  end

end
