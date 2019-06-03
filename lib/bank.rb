class Bank

  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

end