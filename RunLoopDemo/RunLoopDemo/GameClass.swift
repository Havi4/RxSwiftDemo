//
//  GameClass.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/14/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

class LinerCongruentialGenerator: RandomNumberGenerator {
    func random() -> Double {
        return 10
    }
    
    
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTureWithDiceRoll didRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice.init(sides: 6, generator: LinerCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array.init(repeating: 0, count: finalSquare + 1)
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
    }
    
    func swapTwoValue<T>(_ paraOne: inout T, _ paraTwo: inout T) {
        let tem = paraOne
        paraOne = paraTwo
        paraTwo = tem
    }
    
}

class Stack<T> {
    var storeArr = [T]()
    
    func pushItems(_ item: T) {
        storeArr.append(item)
    }
    
    func popItem(_ item: T) -> T {
        return storeArr.removeFirst()
    }
}


struct StackStruct<T> {
    var stack = [T]()
    
    mutating func pushItem(_ item: T) {
        stack.append(item)
    }
    
    mutating func popItem() -> T {
        return stack.popLast()!
    }
}

extension StackStruct {
    mutating func lastItem() -> T? {
        return stack.remove(at: 0)
    }
}

extension String {
    
    func findIndex<T: Equatable>(of findValue: T, inArray: [T]) -> Int? {
        for (index, value) in inArray.enumerated() {
            if value == findValue {
                return index
            }
        }
        return nil
        
    }
}

protocol Container {
    associatedtype Item
    mutating func appendItem(_ item: Item)
    var count: Int{ get }
    subscript(_ index: Int) -> Item? { get }
    
}

struct InStack<Element>: Container {
    
    var stack = [Element]()
    
    var count: Int {
        return stack.count
    }
    
    mutating func appendItem(_ item: Element) {
        stack.append(item)
    }
    
    subscript(_ index: Int) -> Element? {
        return stack[index]
    }
}

extension InStack {
    
    mutating func allItemsMatch<C1: Container, C2: Container >(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 1..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
        
    }
    
}

extension InStack where Element: Comparable {
    mutating func isTopItem(_ topItem: Element) -> Bool {
        if stack.last == topItem {
            return true
        }
        
        return false
    }
}


class Capital {
    
}
