package teamapt.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Bank Application {

	public static void main(String[] args) {
		SpringApplication.run(BankApplication.class, args);
		
	}

}

class TableTransactions{
	String uniqueReference;
	int amount;
	int accountNumber;
}
void deposit(int amount)
{
	if(amount !=0)
	{
		balance = balance+amount;
	}
}
void withdraw(int amount){
	if(amount !=0){
		balance = balance -amount;
		
	}
}
