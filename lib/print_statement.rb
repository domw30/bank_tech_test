class Print

  def pretty_print(transactions)
    format
    transactions.reverse_each do |transaction|
      print " #{transaction[:date]} ||",
            " #{transaction[:credit]}    ||",
            " #{transaction[:debit]}   ||",
            " #{transaction[:balance]}\n"
    end
  end

  def format
    puts ' Date     || Credit    || Debit    || Balance'
  end

end
