require 'bank'

describe Bank do
  describe '#balance' do
    it 'should open an account with a default balance of zero' do
      bank = Bank.new
      expect(bank.balance).to eq 0
    end
  end
end
