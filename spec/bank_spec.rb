require 'bank'

describe Bank do

  subject(:bank) { Bank.new(transactions) }
  let(:transactions) { double("transactions") }


  context 'so that the methods can be called from transactions' do

    describe '#transactions' do
      it 'should create an instance of transactions' do
        expect(bank.transactions).to eq transactions
      end
    end

  end
end
