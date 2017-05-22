// Nastassja Motro

public class Box {

    // member variables
    private double width;
    private double length;
    private double height;

    public Box(double w, double l, double h) {
        width = w;
        length = l;
        height = h;
    }

    public double getSurfaceArea() {
        double surfaceArea = 2 * (length*height + width*height);
        return surfaceArea;
    }

    public double getVolume() {
        double volume = length * width * height;
        return volume;
    }
}
