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
        bank.deposit(2000)
        expect(bank.balance).to eq 2000
      end
    end
  end

  describe '#withdraw' do
    context 'so the user can decrease the bank account balance' do
      it 'should be able to withdraw funds from the account' do
        bank.deposit(2000)
        bank.withdraw(1500)
        expect(bank.balance).to eq 500
      end
    end

    context 'so the user can not go overdrawn' do
      it 'should raise an error if the withdrawal is more than the balance' do
        expect { bank.withdraw(1000) }.to raise_error "Unable to action request"
      end
    end
  end
end
