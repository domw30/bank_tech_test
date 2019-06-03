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
I'd like to be able to create a new bank account.
```
```
As a user,
So that I can store money safely,
I'd like to be able to deposit my money into my bank account and record the date and value.
```
```
As a user,
So that I can retrieve my stored money,
I'd like to be able to withdraw my money out of my bank account and record the date and value.
```
```
As a user,
So that I can remember my bank history,
I'd like to be able to print a bank statement.
```

From this I am able to identify the need for a new object (bank) and four methods (bank.open, bank.deposit, bank.withdraw, bank.print). Once I had identified the objects and methods from my User Stories, I am able to create some feature tests using IRB, thus go on to write unit tests equal to the feature tests.
For example, in IRB, this would mean taking steps such as:

Creating a new bank to have a new object:
```
bank = Bank.new
```
Opening a bank account to be able to make deposits and withdrawals into the correct account_id:
```
bank.open
```
Make a deposit into the open bank account. From the acceptance criteria, we need to pass an amount(value), and the date the deposit was made:
```
bank.deposit(account_id, value, [date])
```
Make a withdrawal from the open bank account. From the acceptance criteria, we need to pass an amount(value), and the date the withdrawal was made:
```
bank.withdraw(account_id, value, [date])
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

### Testing

To run tests run the commands below on the command line:
```
bundle install
```
```
rspec
```
