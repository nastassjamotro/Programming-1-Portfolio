// Nastassja Motro

package shapes;

import java.text.DecimalFormat;

public abstract class Shape {

  public abstract double area();
  
  public abstract double perimeter();
  
  public abstract class Shape {
  
    public abstract double area();
    
    public abstract double perimeter();
    
    public String toString() {
    
      DecimalFormat df = new DecimalFormat("#.##");
      
      return "area = " + df.format(area()) + ", perimeter = " + df.format(perimeter());
    }
  }
}
