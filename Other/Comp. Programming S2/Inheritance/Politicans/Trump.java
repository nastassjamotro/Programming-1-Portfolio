// Nastassja Motro

package politician;

public class Trump implements Politician 
  @Override
  public void saySlogan() {
    System.out.println("Make America Great Again");
  }
  
  @Override
  public double changeTaxes(double income, double initialRate) {
    if(income > 1_000_000) {
      return initialRate - 0.15;
    } else {
      return initialRate - 0.01;
    }
  }
}
