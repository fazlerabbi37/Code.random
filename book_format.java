//author: fr37
//this is a program that will print a document with normal printer in such a way that they will be able to be bind as book
//dedicated to S M Nafiur Rahman. The man who can pass his whole life without doing nothing but reading books.
import java.util.Scanner;

public class book_format {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.println("Enter total page");
    int page = sc.nextInt();
    
    String s=" ";
    
     int count=0;
    for(int counter=2;counter<=page;counter++){
      
      if(count==4){
      count=0;
      continue;
      }
      if(counter==2||counter==3){
        s+=counter+",";
        count++;
      }
      else if(counter%4!=0){
      s+=counter+",";
      count++;
      }
      else{
        s+=counter+","; 
        s+=(counter-3)+",";
        count=count+2;
      }
    }
    
    System.out.println(s);
  }
}