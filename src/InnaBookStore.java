
import java.util.ArrayList;

import java.util.Scanner;
public class InnaBookStore {
    public static void main(String [] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<String[]> checkoutBasket = new ArrayList<>();
        System.out.println("--------------------------------");
        System.out.println("|  Welcome to InnaBook Store   |");
        System.out.println("--------------------------------");

        Users.checkCredentials();

        String textInput = "";
        while(!textInput.equals("exit")) {
            CommonOutput.menu();
            System.out.print("> ");
            textInput = sc.nextLine();

            // if they choose to search for a book by...
            if(textInput.equals("1")) {
                while(true) {
                    CommonOutput.searchMenu();
                    System.out.print("> ");
                    textInput = sc.nextLine();

                    // search by interfaces
                    if(textInput.equals("1")) {
                        while(true) {
                            System.out.print("Search for Title: ");
                            textInput = sc.nextLine();

                            if(textInput.equals("-1")) break;

                            Books.displayBooks(Books.getBooksByTitle(textInput));
                        }
                    }
                    else if(textInput.equals("2")) {
                        //ArrayList<String[]> temp=Orders.getOrder();
                        for (String[]items:temp){
                            checkoutBasket.add(items);
                        }
                        System.out.println("This Is What Your basket Looks Like:");
                        Books.displayBooks(checkoutBasket);
                    }
                    else if(textInput.equals("3")) {
                        while(true) {
                            System.out.print("Search for Genre: ");
                            textInput = sc.nextLine();

                            if(textInput.equals("-1")) break;

                            Books.displayBooks(Books.getBooksByGenre(textInput));
                        }
                    }
                    else if(textInput.equals("4")) {
                        while(true) {
                            System.out.print("Search for Publisher ID: ");
                            textInput = sc.nextLine();

                            if(textInput.equals("-1")) break;

                            Books.displayBooks(Books.getBooksByPublisher(textInput));
                        }
                    }
                    else if(textInput.equals("-1")) {
                        break;
                    }
                }
            }
            else if(textInput.equals("3")) {
                System.out.println("Printing All Books:");
                Books.displayBooks(Books.getAllBooks());

                while (!textInput.equals("quit")){
                    System.out.println("Write quit to leave this page!");
                    System.out.println("Please write the title of the book you want to buy:");
                    textInput = sc.nextLine();

                    Books.displayBooks(Books.getBooksByTitle(textInput));
                }
            }
        }
    }
}
