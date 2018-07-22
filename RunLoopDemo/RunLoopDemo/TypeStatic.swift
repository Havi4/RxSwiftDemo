//
//  TypeStatic.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/14/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level < highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advace(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    
    
}

class Player: NSObject {
    var tracker: LevelTracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level)
        tracker.advace(to: level)
    }
    
    init(_ name: String) {
        playerName = name
    }
    
}

class DemoLevel: NSObject {
    override init() {
        var track: LevelTracker = LevelTracker()
        track.currentLevel = 2
        print(track.currentLevel)
        let player: Player = Player.init("havi")
        player.complete(level: 10)
    }
    
    subscript(index: Int) -> Int {
        get {
            return 1
        }
        
        set {
            
        }
    }
    
    
}
struct TimesTable {
    let mutiplier: Int
    subscript(index: Int) -> Int {
        return mutiplier * index
    }
}

class Subscription: NSObject {
    let timeTable: TimesTable = TimesTable.init(mutiplier: 3)
    override init() {
        super.init()
        print(timeTable[6])
    }
}

struct Fahrenheit {
    var temperatrue: Double
    
}

struct Celsius {
    var temperatureIncelsius: Double
    init(fromFah: Double) {
        temperatureIncelsius = (fromFah - 32)/1.8
    }

    
}

struct Item {
    var price: Int
    var count: Int
    
}

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFuns(consNeeds: Int)
    case outOffStock
}

class VendingMachine {
    var inventory = ["candy": Item.init(price: 12, count: 7),
                     "chips": Item.init(price: 10, count: 4),
                     "pretzels": Item.init(price: 7, count: 11)]
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOffStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFuns(consNeeds: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
    }
    
}

class DemoError {
    func buyFavoriateSnack(person: String, vendingMachice: VendingMachine) throws {
        
        do {
            try vendingMachice.vend(itemNamed: "havi")
        } catch VendingMachineError.invalidSelection {
            print("error")
        } catch VendingMachineError.outOffStock {
            print("no-stock")
        }
    }
    
    
}
