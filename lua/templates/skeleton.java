import java.util.Scanner;
/**
 * ... description ...
 *
 * @author Eli Bell
 * [:VIM_EVAL:]strftime('%F')[:END_EVAL:]
 */
class [:VIM_EVAL:]substitute(expand('%:t'), '\.java$', '', '')[:END_EVAL:] {
 
 /**
  * Main method.
  *
  * @param args unused
  */
  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);
    System.out.println("\nWelcome to my program!\n");
     
    // ...

    System.out.println("\nThanks for using my program!");
  }

}
