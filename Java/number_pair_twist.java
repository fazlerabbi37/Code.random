//author: fr37 
//this wee little Java program takes a String and swaps the places of pairs
import java.util.Scanner;
public class number_pair_twist
{
  public static void main(String [] args)
  {
    //new Scanner object
    Scanner sc= new Scanner(System.in);
    //ask output for ID to Swap 
    System.out.println("Enter ID to Swap");
    //take input
    String input= sc.nextLine();
    // convert to char array
    char [] inputArray = input.toCharArray();
    //for loop for swap
    for(int counter=0;counter<inputArray.length;counter=counter+2)
    {
      //take first char
      char first=inputArray[counter];
      //take second char
      char second=inputArray[counter+1];
      //keep second char in temp char
      char temp=second;
      //keep first char in the possition of second char
      inputArray[counter+1]=first;
      // keep temp char in to the possition of first char
      inputArray[counter]=temp;
    }
    //Output the swaped ID
    System.out.println(String.valueOf(inputArray));
  }
}