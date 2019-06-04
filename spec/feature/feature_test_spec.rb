require 'bank'
require 'transactions'
require 'print_statement'

describe 'User Stories' do

  subject(:bank) { Bank.new(Transactions.new, Print.new) }

  it 'should allow the user to open a bank account' do
    expect(bank).to be_an_instance_of(Bank)
  end

  it 'should allow the user to deposit money' do
    expect { bank.deposit(500) }.not_to raise_error
  end

  it 'should allow the user to withdraw money' do
    bank.deposit(500)
    expect { bank.withdraw(200) }.not_to raise_error
  end

  it 'should allow the user to print a bank statement with dates of transactions' do
    bank.deposit(500)
    bank.withdraw(200)
    expect { bank.print_statement }.not_to raise_error
  end

end
