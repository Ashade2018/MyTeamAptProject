The project is a Stand-alone project using SpringBoot, MySQL database.
A transfer service with APIs to transfer money between two accounts and each application has TABLE Transactions that accepts a reference (unique) i.e ID(like 0001), the amount, and account(nr).
Remember, you would set the default balance as say 0.00$ and account number to 10 digits.
A second class for Table balances that accepts the account number and balance.

Table Transactions: Say the unique reference represents movie.
The amount- $2000
Account number: xxxxxx0000
Table Balance:
Balance: $50,000

API one: Takes in transfer request from account 1 to account 2.
API two: Updates the transactions/balances table.

Answer1: It is like an instant app version of the mobile app.
Answer 2: If one customer taps on the transfer button twice, then we include an alert dialogue that says ‘please wait some minutes to try again’.
Answer 3: When it becomes unavailable, I create an alert dialogue that says ‘Downtime, try again later’.
Answer 4: 2 users(A,B)=>user C at same time- A time difference few seconds apart for the transaction completion.
Answer5: With the use of a unique reference ID