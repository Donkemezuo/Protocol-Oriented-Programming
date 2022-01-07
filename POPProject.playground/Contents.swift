import Cocoa

var greeting = "Hello, playground"

// Classes in Swift - Reference types

class UdemyCourse {
    var category: String
    var title: String
    var author: String
    
    init(category: String, title: String, author: String) {
        self.category = category
        self.title = title
        self.author = author
    }
    func getCourseInfo() -> String {
        return "\(title) | \(category) | \(author)"
    }
}

enum IOSProgramming: String {
    case swift
    case objC
}

class IOSCourse: UdemyCourse {
    var type: IOSProgramming = .swift
    init(title: String, author: String, type: IOSProgramming? = nil) {
        super.init(category: "Programming", title: title, author: author)
        
        if let type = type {
            self.type = type
        }
    }
    
    func detailsCourseInfo() -> String {
        return "\(getCourseInfo()) in \(type.rawValue.uppercased())"
    }
}

enum MusicalInstrument: String {
    case violin
    case piano
}

class MusicCourse: UdemyCourse {
    var instrument: MusicalInstrument
    init(title: String, author: String, instrument: MusicalInstrument) {
        self.instrument = instrument
        super.init(category: "Music", title: title, author: author)
    }
    
    func detailCourseInfo() -> String {
        return "\(getCourseInfo()) in \(instrument.rawValue.uppercased())"
    }
}

let swiftCourse = IOSCourse(title: "Pirate Bay", author: "Andi Setiyadi")
print(swiftCourse.detailsCourseInfo())

let objcCourse = IOSCourse(title: "Awesome Obj-C", author: "John Doe", type: .objC)
print(objcCourse.detailsCourseInfo())

let musicCourse = MusicCourse(title: "Having func with the violin", author: "Jane Smith", instrument: .violin)
print(musicCourse.detailCourseInfo())
