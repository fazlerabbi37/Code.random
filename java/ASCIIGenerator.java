//author: fazlerabbi37

//Java program name: ASCIIGenerator.java

//the purpose of the Java program is to do nothing but generate ASCII code for all alphabet (both upper and lower case) and commonly used symbols


//start new class ASCIIGenerator
public class ASCIIGenerator
{
    //declare a static int type variable ascii_count and assign value 0   
    static int ascii_count=0;

    //start main method
    public static void main(String [] args)
    {
        //run a for loop form 32 to 128 (ascii for know symbols)
        for(int counter=32;counter<128;counter++)
        {
            //pass counter vaule to asgen method and save the return value to String s
            String s=asgen(counter);
            
            //print an red bar '|'
            System.err.print(" | ");
            
            //print s 
            System.out.print(s);

            //print an red bar '|'
            System.err.print(" | ");

            //chech if ascii_count is equal to 4; if yes give a line break, print an red line and set ascii_count to 0 
            if(ascii_count==4)
            {   
                //line break
                System.out.println();

                //print an red line
                System.err.println(" ------------------------------------------------------");
                
                //set ascii_count to 0
                ascii_count=0;
            }
        }
    }
  
    //start static method ascii_generator which takes an int n as param and returns a String with ascii value and symbole
    //return string format: if param n is less then 100 added a '0' at the beginning or keep same, then cast it to char concat n -> char
    //generic format: n -> symbole (i.e: 035 -> #, 114 -> r) 
    public static String asgen(int n)
    {
        //declare a String type variable s and assign value ""
        String s="";

        //declare a char type variable ch and save the char type casted param n
        char ch=(char)n;

        //check if param n is less then 100 added a '0' at the beginning 
        if(n<100)
        {
            s="0"+n+" -> "+ch;
        }
        else
        {
            s=n+" -> "+ch;
        }
        
        //increase ascii_count by 1
        ascii_count=ascii_count+1;

        //return s
        return s;
    } 
}
