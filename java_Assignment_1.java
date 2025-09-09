class Shape {
    double side;
    double length, breadth;
    double radius;

    Shape() {
        System.out.println("Default constructor called.");
    }

    Shape(double side) {
        this.side = side;
    }

    Shape(double length, double breadth) {
        this.length = length;
        this.breadth = breadth;
    }

    Shape(double radius, boolean isCircle) {
        this.radius = radius;
    }

    void displaySquare() {
        double area = side * side;
        System.out.println("Area of Square: " + area);
    }

    void displayRectangle() {
        double area = length * breadth;
        System.out.println("Area of Rectangle: " + area);
    }

    void displayCircle() {
        double area = Math.PI * radius * radius;
        System.out.println("Area of Circle: " + area);
    }

    double area(double d1, double d2) {
        return (d1 * d2) / 2;
    }

    double area(double base, double height, boolean isTriangle) {
        return (base * height) / 2;
    }
}


public class Main {
    public static void main(String[] args) {
        Shape s1 = new Shape(5);       
        s1.displaySquare();

        Shape s2 = new Shape(4, 6);      
        s2.displayRectangle();

        Shape s3 = new Shape(3.5, true); 
        s3.displayCircle();

        Shape s4 = new Shape();          
        System.out.println("Area of Rhombus: " + s4.area(6, 8));
        System.out.println("Area of Triangle: " + s4.area(10, 5, true));
    }
}
