// Nastassja Motro

import java.util.Scanner;

public class PigLatin {
  public static void main(String[] args) {
    System.out.println("Enter word: ");
    Scanner scanner = new Scanner(System.in);
    
    String findFirstVowel = scanner.nextLine();
    char v = Character.toLowerCase(findFirstVowel.charAt(0));
    
    if(v == 'a' || v == 'e' || v == 'i' || v == 'o' || v == 'u') {
      String convertToPigLatin = findFirstVowel + "ay";
      System.out.println(convertToPigLatin);
    } else {
      String first = findFirstVowel.substring(0, 1);
      String slice = findFirstVowel.substring(1, findFirstVowel.length());
      System.out.println(slice + first + "ay");
    }
  }
}
