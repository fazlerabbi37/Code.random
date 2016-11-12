//author: fr37 
//this is a simple Java program to encode and decode Five by Five Tap (aka Knock) code.
import java.util.Scanner;
public class FiveByFiveTapCodeEncoderDecoder
{
  static char[][] alpha = {
        { 'a','b','c','d','e'},
        { 'f','g','h','i','j'},
        { 'l','m','n','o','p'},
        { 'q','r','s','t','u'},
        { 'v','w','x','y','z'}};
  
  public static void main(String [] args)
  {
   Scanner sc= new Scanner(System.in);
   System.out.println("To encoder enter 1, to decoder enter 0");
   int methodCall = sc.nextInt();
   System.out.println("Enter Message");
   sc.nextLine();
   String str= sc.nextLine();
   if(methodCall==1)
   {
     encoder(str);
   }
   else if(methodCall==0)
   {
     decoder(str);
   }
  }
  
  private static void encoder(String input)
  {
    String lowInput=input.toLowerCase();
    String output="";
    for(int counter=0;counter<lowInput.length();counter++)
    {
      char c=lowInput.charAt(counter);
      for(int counter1=0;counter1<5;counter1++)
      {
        for(int counter2=0;counter2<5;counter2++)
        {
          if(alpha[counter1][counter2]==c)
          {
            output=output+(counter1+1)+(counter2+1);
          }
        }
      }
    }
    System.out.println(output);
  }
  
  
  private static void decoder(String input)
  {
    String output="";
    for(int counter=0;counter<input.length();counter=counter+2)
    {
      int c=(int)(input.charAt(counter)-48);
       int d=(int)(input.charAt(counter+1)-48);
      output=output+alpha[c-1][d-1];
    }
    
    System.out.println(output);
}
}