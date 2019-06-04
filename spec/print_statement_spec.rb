require 'print_statement'

describe Print do

  subject(:print) { Print.new }

  let(:transactions) do
    [{ date: '04/06/19', credit: '%.2f' % 500, debit: '------', balance: '%.2f' % 500 },
    { date: '04/06/19', credit: '------', debit: '%.2f' % 500, balance: '%.2f' % 0 }]
  end

  describe '#pretty_print' do
    let(:pretty_print) do
      " Date     || Credit    || Debit    || Balance\n" \
      " 04/06/19 || ------    || 500.00   || 0.00\n" \
      " 04/06/19 || 500.00    || ------   || 500.00\n"

    end
    it 'should print the transactions' do
      expect { print.pretty_print(transactions) }.to output(pretty_print).to_stdout
    end
  end

end
