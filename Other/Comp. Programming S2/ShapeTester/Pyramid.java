// Nastassja Motro

public class Pyramid {

    // member variables
    private double height;
    private double baseLength;

    public Pyramid(double h, double b) {
        height = h;
        baseLength = b;
    }
    
    public double getSurfaceArea() {
        double sideLength = Math.sqrt(height*height + baseLength*baseLength / 4);
        double surfaceArea = 2 * sideLength * baseLength;
        return surfaceArea;
    }
    
    public double getVolume() {
        double volume = height * baseLength * baseLength / 3;
        return volume;
    }
}
