import UIKit

class Dog {
    var name: String
    var age: Int
    var weight: Double
    var breed: String
    
    init(name: String, age: Int, weight: Double, breed: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.breed = breed
    }
    
    func bark(to someone: String) {
        print("bark to \(someone)")
    }
    
    func eat(_ food: String) {
        print("eat \(food)")
    }
}

var goldenRetriever = Dog(name: "Golden", age: 2, weight: 10.2, breed: "Golden Retriever")

class Student {
    var name: String
    var age: Int
    var school: String
    var grade: Int
    
    init(name: String, age: Int, school: String, grade: Int) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
}

var soohanlee = Student(name: "Soohan Lee", age: 19, school: "JukJeon", grade: 3)

class Phone {
    var model: String
    var price: Int
    var haveFaceID: Bool
    
    init(model: String, price: Int, haveFaceID: Bool) {
        self.model = model
        self.price = price
        self.haveFaceID = haveFaceID
    }
    
    func call(to someone: String) {
        print("call to \(someone)")
    }
    
    func text(to someone: String) {
        print("text to \(someone)")
    }
}

class coffee {
    var name: String
    var price: Int
    var origin: String
    
    init(name: String, price: Int, origin: String) {
        self.name = name
        self.price = price
        self.origin = origin
    }
}

let cafeLatte = coffee(name: "Cafe Latte", price: 3000, origin: "Ethiopia")



class Calculator {
    private var value = 0.0
    
    func add(_ number: Double) { value += number }
    
    func subtract(_ number: Double) { value -= number }
    
    func multiply(_ number: Double) { value *= number }
    
    func divide(_ number: Double) { value /= number }
    
    func reset() { value = 0 }
    
    func getValue() -> Double { value }
}



class Square {
    private var width: Double
    private var height: Double
    
    private var area: Double
    private var perimeter: Double
    
    init(width: Double) {
        self.width = width
        self.height = width
        
        area = width * height
        
        perimeter = 4 * width
    }
    
    func getArea() -> Double { area }
    func getPerimeter() -> Double { perimeter }
}

let square = Square(width: 13)
square.getArea()
square.getPerimeter()

class Rectangle {
    private var width: Double
    private var height: Double
    
    private var area: Double
    private var perimeter: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        
        area = width * height
        
        perimeter = (2 * width) + (2 * height)
    }
    
    func getArea() -> Double { area }
    func getPerimeter() -> Double { perimeter }
}

let rectangle = Rectangle(width: 5, height: 12)
rectangle.getArea()
rectangle.getPerimeter()

class Circle {
    private var radius: Double
    
    private var area: Double
    private var circumference: Double
    
    init(radius: Double) {
        self.radius = radius
        
        area = Double.pi * pow(radius, 2)
        
        circumference = 2 * Double.pi * radius
    }
    
    func getArea() -> Double { area }
    func getcircumference() -> Double { circumference }
}

let circle = Circle(radius: 6)
circle.getArea()
circle.getcircumference()

class Triangle {
    private var width: Double
    private var height: Double
    
    private var area: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        
        area = width * height / 2
    }
    
    func getArea() -> Double { area }
}

let triangle = Triangle(width: 3, height: 14)
triangle.getArea()

class Trapezoid {
    private var upperWidth: Double
    private var lowerWidth: Double
    private var height: Double
    
    private var area: Double
    
    init(upperWidth: Double, lowerWidth: Double, height: Double) {
        self.upperWidth = upperWidth
        self.lowerWidth = lowerWidth
        self.height = height
        
        area = 0.5 * height * (upperWidth + lowerWidth)
    }
    
    func getArea() -> Double { area }
}

let trapezoid = Trapezoid(upperWidth: 3, lowerWidth: 2, height: 5)
trapezoid.getArea()

class Cube {
    private var width: Double
    private var height: Double
    private var depth: Double
    
    private var volume: Double
    
    init(width: Double) {
        self.width = width
        self.height = width
        self.depth = width
        
        volume = width * height * depth
    }
    
    func getVolume() -> Double { volume }
}

let cube = Cube(width: 7)
cube.getVolume()

class RectangularSolid {
    private var width: Double
    private var height: Double
    private var depth: Double
    
    private var volume: Double
    
    init(width: Double, height: Double, depth: Double) {
        self.width = width
        self.height = height
        self.depth = depth
        
        volume = width * height * depth
    }
    
    func getVolume() -> Double { volume }
}

let rectangularSolid = RectangularSolid(width: 3, height: 2, depth: 5)
rectangularSolid.getVolume()

class CircularCylinder {
    private var radius: Double
    private var height: Double
    
    private var volume: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
        
        volume = Double.pi * pow(radius, 2) * height
    }
    
    func getVolume() -> Double { volume }
}

let circularCylinder = CircularCylinder(radius: 3, height: 6)
circularCylinder.getVolume()

class Sphere {
    private var radius: Double
    
    private var volume: Double
    
    init(radius: Double) {
        self.radius = radius
        
        volume = 4 / 3 * Double.pi * pow(radius, 3)
    }
    
    func getVolume() -> Double { volume }
}

let sphere = Sphere(radius: 2)
sphere.getVolume()

class Cone {
    private var height: Double
    private var radius: Double

    private var volume: Double
    
    init(height: Double, radius: Double) {
        self.height = height
        self.radius = radius
        
        volume = 1 / 3 * Double.pi * pow(radius, 2) * height
    }
    
    func getVolume() -> Double { volume }
}

let cone = Cone(height: 2, radius: 3)
cone.getVolume()
