// Nastassja Motro

package shapes;

public class Circle extends Shape {
  private double radius;
  
  public Cirlce(double _radius) {
    radius = _radius;
  }
  
  public double area() {
    return Math.PI * radius * radius;
  }
  
  public double perimeter() {
    return 2 * Math.PI * radius;
  }
}
