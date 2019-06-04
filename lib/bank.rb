class Bank

  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(value)
    balance_plus(value)
  end

  def withdraw(value)
    raise "Unable to action request" if @balance < value

    balance_subtract(value)
  end

  private

  def balance_plus(value)
    @balance += value
  end

  def balance_subtract(value)
    @balance -= value
  end

end
