// Nastassja Motro

package shapes;

public class Triangle extends Shape {
  private double side1;
  private double side2;
  private double side3;
  
  public Triangle(double _side1, double _side2, double _side3) {
    side1 = _side1;
    side2 = _side2;
    side3 = _side3;
  }
  
  public double area() {
    double p = perimeter() / 2;
    return Math.sqrt(p * (p - side1) * (p - side2) * (p - side3));
  }
  
  public double perimeter() {
    return side1 + side2 + side3;
  }
}
