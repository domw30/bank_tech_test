require 'transactions'

describe Transactions do

  subject(:transaction) { described_class.new }

  TIME = Time.now.strftime("%d/%m/%y")

  describe '#balance' do
    context 'when creating a new bank account it should' do
      it 'create an account with a default balance of zero' do
        expect(transaction.balance).to eq 0
      end
    end
  end

  describe '#deposit' do
    context 'so the user can increase the bank account balance' do
      it 'should be able to deposit funds into the account' do
        transaction.deposit(2000)
        expect(transaction.balance).to eq 2000
      end
    end
  end

  describe '#withdraw' do
    context 'so the user can decrease the bank account balance' do
      it 'should be able to withdraw funds from the account' do
        transaction.deposit(2000)
        transaction.withdraw(1500)
        expect(transaction.balance).to eq 500
      end
    end

    context 'so the user can not go overdrawn' do
      it 'should raise an error if the withdrawal is more than the balance' do
        expect { transaction.withdraw(1000) }.to raise_error "Unable to action request"
      end
    end
  end

  describe '#transactions' do
    context 'so transactions history is correct' do
      it 'should be initialized with an empty array' do
        expect(transaction.transactions).to eq []
      end
    end

    context 'so the transaction history can be recorded' do
      it 'deposit transaction information should be displayed' do
        transaction.deposit(500)
        expect(transaction.transactions.length).to eq 1
      end

      it 'withdraw transaction information should be displayed with other records' do
        transaction.deposit(500)
        transaction.withdraw(100)
        expect(transaction.transactions.length).to eq 2
      end
    end
  end

end
