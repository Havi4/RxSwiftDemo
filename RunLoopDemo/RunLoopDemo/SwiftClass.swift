//
//  SwiftClass.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/14/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

class SwiftClass: NSObject {
    var resolution = SwiftStruct.init(width: 100, height: 200)
    
    override init() {
        
    }
    
    
}

class DataImporter {
    var fileName = "data.txt"
    
}

class DataManager {
    lazy var importer = DataImporter()
    
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point.init(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
    
    
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
    
    var volumeOb:Double = 0 {
        willSet {
        }
        
        didSet {
            
        }
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("new:\(newValue)")
        }
        
        didSet {
            if oldValue > totalSteps {
                
            }
        }
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

struct PointNew {
    var x = 0.0
    var y = 0.0
    mutating func moveBy(_ xDelta: Double, _ yDelta: Double) {
        y += yDelta
        x += xDelta
    }
}

class MyStruct {
    init() {
        
    }
    func test() {
        
        var somePoint: PointNew = PointNew.init(x: 10, y: 10)
        somePoint.moveBy(20, 20)
        
        var square: Rect = Rect.init(origin: Point.init(x: 10, y: 10), size: Size.init(width: 10, height: 10))
        let initialSquareCenter = square.center
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

struct SwiftStruct {
    var width = 0
    var height: Float
}
