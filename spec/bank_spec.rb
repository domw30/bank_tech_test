require 'bank'

describe Bank do

  subject(:bank) { Bank.new(transactions, print) }
  let(:transactions) { double(:transactions, deposit: '') }
  let(:print) { double("print") }

  context 'so that the methods can be called from transactions' do

    describe '#transactions' do
      it 'should create an instance of transactions' do
        expect(bank.transactions).to eq transactions
      end
    end

    describe '#deposit' do
      it 'transactions can use deposit method' do
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

  describe '#print_statement' do
    before do
      allow(print).to receive(:pretty_print)
      allow(transactions).to receive(:transactions)
    end

    it 'print should receive the pretty print method' do
      bank.print_statement
      expect(print).to have_received(:pretty_print)
    end

    it 'transactions should receive the transactions method' do
      bank.print_statement
      expect(transactions).to have_received(:transactions)
    end
  end

end
