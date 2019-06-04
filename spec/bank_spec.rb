require 'bank'

describe Bank do

  subject(:bank) { Bank.new(transactions, print) }
  let(:transactions) { double("transactions") }
  let(:print) { double("print") }


  context 'so that the methods can be called from transactions' do

    describe '#transactions' do
      it 'should create an instance of transactions' do
        expect(bank.transactions).to eq transactions
      end
    end

    describe '#deposit' do
      it 'transactions can use deposit method' do
        allow(transactions).to receive(:deposit)
        bank.deposit(500)
        expect(transactions).to have_received(:deposit)
      end
    end

    describe '#withdraw' do
      it 'transactions can use withdraw method' do
        allow(transactions).to receive(:deposit)
        allow(transactions).to receive(:withdraw)
        bank.deposit(500)
        bank.withdraw(200)
        expect(transactions).to have_received(:withdraw)
      end
    end

  end
end
