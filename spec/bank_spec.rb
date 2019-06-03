require 'bank'

describe Bank do

  subject(:bank) { described_class.new }

  describe '#balance' do
    context 'when creating a new bank account it should' do
      it 'create an account with a default balance of zero' do
        expect(bank.balance).to eq 0
      end
    end
  end

  describe '#deposit' do
    context 'so the user can increase the bank account balance' do
      it 'should be able to deposit funds into the account' do
        value = 2000
        bank.deposit(value)
        expect(bank.balance).to eq value
      end
    end
  end

  describe '#withdraw' do
    context 'so the user can decrease the bank account balance' do
      it 'should be able to withdraw funds from the account' do
        value = 2000
        value2 = 1500
        bank.deposit(value)
        bank.withdraw(value2)
        expect(bank.balance).to eq 500
      end
    end
  end
end
