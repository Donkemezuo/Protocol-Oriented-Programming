import Cocoa

var greeting = "Hello, playground"
/*
 Protocols can inherit other protocols just like structs and classes
 - If an object (class or struct) conforms to a protocol that is conforming to another protocol, such object will have to conform to the deserved protocol and it's parent protocol
 */


protocol Person {
    var name: String { get set }
    
    func doActivity()
}

// Inheriting from protocol Person
protocol Tenant: Person {
    var unitType: UnitType { get set }
    func payRent()
}

struct Occupant: Tenant, Person {
    var unitType: UnitType
    var name: String
    
    func payRent() {
        print("Occupant monthly rent is \(unitType.rentFee)")
    }

    func doActivity() {
        
    }
    
    
}


enum UnitType {
    case A(withGarage: Bool)
    case B(withGarage: Bool)
    
    var rentFee: Double {
        switch self {
        case .A(withGarage: let hasGarage):
            return hasGarage ? (1200.0 + 200.0) : 1200
        case .B(withGarage: let hasGarage):
            return hasGarage ? (1300.0 + 200.0) : 1300
        }
    }
}


let occupant1 = Occupant(unitType: .B(withGarage: true), name: "4B")

print(occupant1.payRent())


/*
 Optionals in Protocols
 - methods and properties that might not be used by a conforming class or struct can be declared as an optional
 - to declare a protocol with options, we need to add the @objc keyword
 - All optional methods and properties must be declared with @objc optional keyword
 - Only classes can conform to protocols with optional method or properties
 - Structs can not conform to protocols with optional method or properties
 */


@objc protocol HumanBeing {
    var name: String { get set }
    @objc optional var ssn: String { get set }
    
    @objc optional func getssn() -> String
}


protocol ATenant: HumanBeing {
    var ssn: String { get set }
    var unitType: String { get set }
}

class AnOccupant: ATenant, HumanBeing {
    var ssn: String
    var unitType: String
    var name: String
    
    init(ssn: String, unitType: String, name: String) {
        self.ssn = ssn
        self.unitType = unitType
        self.name = name
    }
    
    func getssn() -> String {
        return ssn
    }
}

// A class conformning to an optional protocol
/*
 Optionals in Protocol is not the best idea since  those properties will still be available but returns a run time error if you try to use them
 */

class Student: HumanBeing {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let occupant = AnOccupant(ssn: "123-44-5678", unitType: "A", name: "Jim")

print(occupant.getssn())


/*
 How to avoid Optionals in Protocols
 - If a protocol with optionals is declared, such protocols cannot inherit from other protocols who does not have an optional.
 
 - Protocols that contain enums properties cannot be optional in swift 
 */

/*
 Objects who conform to the same Protocol can be used to create an array of that protocol type
 */
