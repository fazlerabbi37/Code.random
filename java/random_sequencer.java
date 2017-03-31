//author: fazlerabbi37

//Java program name: random_sequencer.java

//the purpose of the Java program


//import java.util
import java.util.*;


class random_sequencer
{
	public static void main (String[] args)
	{
		//create new Random class object of name rand
		Random rand = new Random();
		//import new Scanner class object of name sc
		Scanner sc = new Scanner(System.in);

		//declare a String of name s and initilize with empty string
		String s= "";

		//ask for option number and save it in var opt_num
		System.out.println("Enter number of options:");
		int opt_num = sc.nextInt();

		//generate a random number form opt_num and save it in var loop_num
		int loop_num = rand.nextInt(opt_num);

		//run a loop that starts from 1 and ends at loop_num
		for (int i=1; i<= loop_num; i++)
		{
			//in each loop generate a random number form opt_num and save it in var option
			int option = rand.nextInt(opt_num) +1 ;
			//concat the number in the string s
			s=s+option;
		}
		//print s
		System.out.println(s);
	}
}
