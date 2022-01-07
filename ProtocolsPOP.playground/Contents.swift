import Cocoa

var greeting = "Hello, playground"

/*
 Protocols in Swift - are a blueprint containing methods and properties needed to implement a particular task
 - Classes and Structs can conform to a protocol
 
 Property Declaration in Swift
 - Properties declared in a protocol behaves differently depending on how they are declared
 - Get only properties: Meaning a property can only be read
 - Set: A property can be written to
 
 - Get set {} - Property can be read and written to
 */

protocol Person {
    // The name property can be read and written to by a class or struct that conforms to Person protocol
    var name: String { get set }
    
    // properties or methods in protocols are not initialized or implemented. They only serve as a blueprint
    
    func performActivity()
    mutating func updateName(name newName: String) -> String
    
}

struct Student: Person {
    var name: String
    func performActivity() {
        print("I want to learn ")
    }
    
   mutating func updateName(name newName: String) -> String {
        self.name = newName
        return "The new name is \(name)"
    }
}

class StudentClass: Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    func performActivity() {
        print("I want to learn ")
    }
    
    func updateName(name newName: String) -> String {
        self.name = newName
        return "The new name is \(name)"
    }
}

var student = StudentClass(name: "Tariladou Donkemezuo ")
print(student.name)
student.updateName(name: "Raymond Tariladou Donkemezuo")
print(student.name)


/*
 Protocol Initialization
 */

protocol Human {
    init(name: String, age: Int)
}

struct StudentStruct: Human {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class StudentClass2: Human {
    var isAdult: Bool
    var name: String
    var age: Int
    
    init(name: String, age: Int, isAdult: Bool) {
        self.name = name
        self.age = age
        self.isAdult = isAdult
    }
    
    required convenience init(name: String, age: Int) {
        let isAdult = false
        self.init(name: name, age: age, isAdult: isAdult)
    }
}

/*
 Protocol Extensions are used to provide a default implementation of the functions in our protocol.
 
 - If a protocol has an extension with default implementations of it methods, then when an object conforms to it, the object wont be required to implement those functions
 
 - We can also override the default implementation
 */


protocol Country {
    var name: String { get set }
    func doActivity()
}

extension Country {
    func doActivity() {
        print("\(name) is just walking around")
    }
}

struct Nation: Country {
    var name: String
}

let nigeria = Nation(name: "Nigeria")

// Overriding default implementation of method in protocol
struct AState: Country {
    var name: String
    
    func doActivity() {
        print("\(name) is an independent state")
    }
}

let benin = AState(name: "Benin Republic")
print(benin.doActivity())
