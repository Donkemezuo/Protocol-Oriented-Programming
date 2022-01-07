import UIKit

var greeting = "Hello, playground"

// Structs in Swift - Value types
/*
 - Mutating keyword in methods in structs allows us to change/mutate properties in our struct.
 This is because since structs are value types, mutating a copy doesn't affect the original hence, we use the mutating keyword to update store properties in a swift struct
 - Structs have a default initializer called memberwise initializer
 
 - Structs and Classes in Swift can have multiple initializers
 
 */
struct UdemyCourse {
    var category: String
    var title: String
    var author: String
    
    func getCourseInfo() -> String {
        return "\(title) | \(category) | \(author)"
    }
    
    mutating func updateTitle(with title: String) {
        self.title = title
    }
}

var course1 = UdemyCourse(category: "Swift Programming", title: "Pirate Bay", author: "Andi Setiyadi")
print(course1.getCourseInfo())

course1.updateTitle(with: "Pirate Bay in Swift 4 and iOS 11")
print(course1.getCourseInfo())


// Class initialization
/*
 - Class can have multiple initializers
 - The are two types of class initializers in Swift
 - There's the Default or Designated initializer
 - There's the convenient initializer
 
 - When a class is created it is expected that the default initializer is created and alln properties in the class are initialized
 
 - With Convenience init(), you don't have to initializer every property of the class
 
 */
class ShoppingCartClass {
    var item: String
    var price: Double
    var description: String?
    init(item: String, price: Double) {
        self.item = item
        self.price = price
    }
}


struct ShoppingCartStruct {
    var item: String
    var price: Double
    var quantity: Int

    init(item: String, price: Double) {
        self.init(item: item, price: price, quantity: 1)
    }
    
    init(item: String, price: Double, quantity: Int) {
        self.item = item
        self.price = price
        self.quantity = quantity
    }
    
    func getDetails() -> String {
        return "\(item) | $\(price) | \(quantity)"
    }
}

let scStruct1 = ShoppingCartStruct(item: "Pen", price: 4.99)
print(scStruct1.getDetails())

let scStruct2 = ShoppingCartStruct(item: "Book", price: 12.99, quantity: 3)
print(scStruct2.getDetails())


// Class initializer with Convenience init()

class Book {
    var title: String
    var price: Double
    var coverType: String
    // Default or Designated Initializer
    init(title: String, price: Double, coverType: String) {
        self.title = title
        self.price = price
        self.coverType = coverType
    }
    // Convenience init
    convenience init(title: String, price: Double) {
        let coverType = "Softcover"
        self.init(title: title, price: price, coverType: coverType)
    }
}

/*
 When a subclass with properties inherit from a parent class, such class will initialize it's local properties first before calling the super init of it's parent class
 */
class Fiction: Book {
    var isComic: Bool
    override init(title: String, price: Double, coverType: String) {
        self.isComic = false
        super.init(title: title, price: price, coverType: coverType)
    }
    
    init(title: String, price: Double, coverType: String, isComic: Bool) {
        self.isComic = isComic
        super.init(title: title, price: price, coverType: coverType)
    }
}
