// Nastassja Motro

public class Sphere {

    // member variables
    private double radius;
    
    public Sphere(double r) {
        radius = r;
    }
    
    public double getSurfaceArea() {
        double surfaceArea = 4 * Math.PI * radius * radius;
        return surfaceArea;
    }
    
    public double getVolume() {
        double volume = (4.0 / 3.0) * Math.PI * radius * radius * radius;
        return volume;
    }
}
