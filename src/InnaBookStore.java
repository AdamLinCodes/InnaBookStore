import java.util.Scanner;
public class InnaBookStore {
    public static void main(String [] args) {
        Scanner sc = new Scanner(System.in);

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
                    else if(textInput.equals("3")) {
                        while(true) {
                            System.out.print("Search for Genre: ");
                            textInput = sc.nextLine();

                            if(textInput.equals("-1")) break;

                            Genre.displayGenre(Genre.getGenre(textInput));
                        }
                    }
                    else if(textInput.equals("4")) {
                        break;
                    }
                }
            }
            else if(textInput.equals("3")) {
                Orders.getOrder();
            }
        }
    }
}
