//author: fr37 
//the purpose of this Java program is to do nothing but generate ASCII code for all alphabet (both upper and lower case) and commonly used symbols
public class ASCIIGenerator
{
  static int ascou=0;
  public static void main(String [] args)
  {
    for(int counter=32;counter<128;counter++)
    {
      String s=asgen(counter);
      System.err.print(" | ");
      System.out.print(s);
      System.err.print(" | ");
      if(ascou==4)
      {
        System.out.println();
      System.err.println(" ------------------------------------------------------");
      ascou=0;
      }
    }
  }
  
  public static String asgen(int n)
  {
    String s="";
    char ch=(char)n;
    if(n<100)
    {
      s="0"+n+" -> "+ch;
    }
    else
    {
      s=n+" -> "+ch;
    }
    ascou=ascou+1;
    return s;
  }
}