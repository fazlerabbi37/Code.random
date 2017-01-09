//author: fazlerabbi37
//the intention behind writing this simple Java program was to generate a random item for a list of given items 

import java.util.Scanner;

public class RandomItem
{
  public static void main(String [] agrs)
  {
    Scanner sc = new Scanner(System.in);
    
    System.out.println("Enter the number of items");
    int itemNum = sc.nextInt();
    
    String [] itemArr = new String [itemNum];
    
    for(int counter=0;counter<itemNum;counter++)
    {
      System.out.println("Enter Item");
      if(counter==0)
      {sc.nextLine();}
      itemArr[counter]=sc.nextLine();
    }
    
    System.out.println("Randomly selected item: "+ itemArr[randomNumberGenerator(0,itemNum-1)]);
  }
  
  //Random Number Generator With Range
  private static int randomNumberGenerator(int min, int max)
  {
    int range = (max - min) + 1;     
    return (int)(Math.random() * range) + min;
  }
}
