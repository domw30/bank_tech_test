require 'bank'

describe Bank do
  describe '#balance' do
    context 'when creating a new bank account it should' do
      it 'create an account with a default balance of zero' do
        bank = Bank.new
        expect(bank.balance).to eq 0
      end
    end
  end
end
