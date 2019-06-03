# Bank tech test

Week 10 of Makers Academy Coding Bootcamp, Individual Tech Test practice.

The task is to practice a tech test by creating a model of a bank, a customer, and accounts. The program should be able to handle standard banking practices such as making deposits, withdrawals and printing statements with the history of the account.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012.

**And** a deposit of 2000 on 13-01-2012.

**And** a withdrawal of 500 on 14-01-2012.

**When** she prints her bank statement.

**Then** she would see.

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
The above example highlights how I have used TDD. The aim is to drive the program using the errors on a feature test level, and then a unit test level.

### Testing

To run tests run the commands below on the command line:
```
bundle install
```
```
rspec
```
