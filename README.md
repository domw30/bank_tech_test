# Bank tech test

Week 10 of Makers Academy Coding Bootcamp, Individual Tech Test practice.

The task is to practice a tech test by creating a model of a bank, a customer, and accounts. The program should be able to handle standard banking practices such as making deposits, withdrawals and printing statements with the history of the account.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

###  Installation

From the command line, clone this repository to your machine:
```
git clone git@github.com:domw30/bank_tech_test.git
```
once cloned, run this command for gems:
```
bundle install
```

### Using the program in IRB

Require the file:
```
require './lib/bank.rb'
```
Create a new bank account and enter transactions:
```
my_bank = Bank.new(Transactions.new, Print.new)
my_bank.deposit(500)
my_bank.withdraw(400)
my_bank.deposit(300)
my_bank.print_statement

 Date     || Credit  || Debit    || Balance
 04/06/19 || 300.00  || ------   || 400.00
 04/06/19 || ------- || 400.00   || 100.00
 04/06/19 || 500.00  || ------   || 500.00
```

### Testing

To run tests run the commands below on the command line:
```
bundle install
```
```
rspec
```
I have used Rubocop as the linter to ensure code formatting is of industry standards. To run rubocop enter the following on the command line:
```
rubocop
```

### Approach

Firstly, reading the requirements for the tech test I have noted that the user should be able to interact with the code through a REPL, in this case IRB. Using the requirements guides me to what objects I would need and therefore able to create feature tests. The requirements suggest having a bank account that can deposit, withdraw and print a statement. With this information I can write user stories.

User Stories:
```
As a user,
So that I can keep track of my money,
I'd like to be able to create a new bank account with a default balance of zero.
```
```
As a user,
So that I can store money safely,
I'd like to be able to deposit my money into my bank account.
```
```
As a user,
So that I can retrieve my stored money,
I'd like to be able to withdraw my money out of my bank account.
```
```
As a user,
So that I can remember my bank history,
I'd like to be able to print a bank statement.
```
```
As a user,
So that I can recall the timing of my transactions,
I'd like to be able to view the date of transactions.
```

From this I am able to identify the need for three objects (bank, transactions, statement) and three methods (bank.deposit, bank.withdraw, bank.print). Once I had identified the objects and methods from my User Stories, I am able to create some feature tests using IRB, thus go on to write unit tests equal to the feature tests.
For example, in IRB, this would mean taking steps such as:

Creating a new bank to have a new object:
```
bank = Bank.new
```
Make a deposit into the open bank account. From the acceptance criteria, we need to pass an amount(value):
```
bank.deposit(value)
```
Make a withdrawal from the open bank account. From the acceptance criteria, we need to pass an amount(value):
```
bank.withdraw(value)
```
In addition, we want to be able to print a bank statement that displays date, credit, debit and balance:
```
bank.print
```
The command above would then display in IRB like so:
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

Example of my approach using IRB for feature testing:

```
irb
2.6.0 :001 > require './lib/bank.rb'
 => true
2.6.0 :002 > bank = Bank.new
 => #<Bank:0x00007fca1b15d280 @balance=0>
2.6.0 :003 > bank.balance
 => 0
2.6.0 :004 > bank.deposit(2000)
 => 2000
2.6.0 :005 > bank
 => #<Bank:0x00007fca1b15d280 @balance=2000>
 2.6.0 :006 > bank.withdraw(2000)
Traceback (most recent call last):
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):6
NoMethodError (undefined method `withdraw' for #<Bank:0x00007fca1b15d280 @balance=2000>)
2.6.0 :007 >
```
The above example highlights how I have used TDD. The aim is to drive the program using the errors on a feature test level, and then match the error on a unit test level to determine what steps to take next.
```
irb
2.6.0 :001 > require './lib/bank.rb'
 => true
2.6.0 :002 > bank = Bank.new
 => #<Bank:0x00007fa5b3838fa0 @balance=0>
2.6.0 :003 > bank.deposit(2000)
 => 2000
2.6.0 :004 > bank.withdraw(1500)
 => 500
2.6.0 :005 > bank.withdraw(1000)
 => -500
 ```
 The above example highlights the bank.withdraw feature working as the value of the amount to withdraw decreases the balance to 500. In addition, running this in IRB allowed me to see where an error should be raised if the balance is less than the withdrawal value, rather than returning -500 as above.
 ```
 irb
2.6.0 :001 > require './lib/bank.rb'
 => true
2.6.0 :002 > bank = Bank.new
 => #<Bank:0x00007fd133874bd0 @balance=0>
2.6.0 :003 > bank.deposit(2000)
 => 2000
2.6.0 :004 > bank.withdraw(1000)
 => 1000
2.6.0 :005 > bank.withdraw(3000)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from /Users/student/Projects/bank_tech_test/lib/bank.rb:16:in `withdraw'
RuntimeError (Unable to action request)
```
The above IRB example illustrates the use of raising an error if the withdrawal value is greater than the balance value.

Following the above process cycle using TDD, I have been able to create a working program that reflects standard bank practices. I was able to remove logic from the bank class into a transaction class, and I also created a print class to handle the statements.

Also, I have created three test files that handle tests separately for each of the classes, as well as a feature test file to test against the user stories.
