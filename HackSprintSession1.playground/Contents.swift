//: Playground - noun: a place where people can play

import UIKit

// Constants and Variables
let maximumLoginAttempts = 10
var currentNumberOfAttempts = 0

// Type Inference
var x = 5            // x is of type Int!
var y = 3.8          // y is of type Double!
var s = "UCLA"       // s is of type String!
var b = false        // b is of type Bool!

// Type Annotations
var i: Int
var d: Double
var c: Character = "C"

// i += 5

// If statements
let hunger = 10
if hunger < 20 {
    print("I can deal with Bplate portions.")
}
else if hunger >= 20 {
    print("I need De Neve Late Night Chicken Tenders")
}
else {
    // Never triggered...
    print("Let’s go to Feast.")
}

// Functions
func squareNum(n: Int) -> Int {
    return n * n
}

let num = squareNum(n: 5)
print(num)

// No return type/parameters
func printHelloWorld() {
    print("Hello, world!")
}

printHelloWorld()

// Classes
class Flatulan {
    
    /* Properties */
    
    var x: Int
    var y: Int
    
    /* Methods */
    
    init(initialX: Int, initialY: Int) {
        x = initialX
        y = initialY
    }
    
    func moveRight() {
        x += 1
    }
    
    func fart() {
        print("Farted at position \(x), \(y)")
    }
    
}

// Class instances
let myFlatulan = Flatulan(initialX: 0, initialY: 0)
myFlatulan.moveRight()
myFlatulan.fart()
