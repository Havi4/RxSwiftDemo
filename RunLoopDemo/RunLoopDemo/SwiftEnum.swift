//
//  SwiftEnum.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/14/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

class EnumClass {
    //first define一个单纯的相关联的值
    enum CompassPoint {
        case north
        case south
        case east
        case west
        
        var rawValue: String {
            switch self {
            case .north:
                return "north"
            default:
                return "other"
            }
        }
        
        
    }
    
    enum Planet {
        case mercure, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    var compass: CompassPoint = .north
    
    var planet: Planet = .earth
    
    var newPlanet = Planet.earth
    //如果指定了类型可以使用。
    //相关值
    
    enum AssociateValue {
        case upc(Int)
        case qucode(String)
    }
    
    var associateValue: AssociateValue = .upc(100)
    
    init() {
        switch associateValue {
        case .upc(let num):
            print(num)
        default:
            print("default")
        }
        print(newPlanet)
    }
    //raw values
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
    }
    let rawValue: ASCIIControlCharacter = .tab
    
    func printValue() {
        print(rawValue.rawValue)
        print(compass.rawValue)
        print(intRaw1.rawValue)
    }
    
    //
    enum NewPlanet: Int {
        case mercury = 1, venus, earth, mars
    }
    
    enum IntRawValue: Int {
        case hourseOne
        case hourseTwo
        case hourseThree
    }
    
    
    
    let intRaw1: IntRawValue = .hourseOne
    let aa: NewPlanet? = NewPlanet.init(rawValue: 2)
    
    func testRawValue() {
        let planetValue = NewPlanet.init(rawValue: 2)
        sum = ArithmeticExpression.addition(five, four)
        product = ArithmeticExpression.mutiplication(sum!, ArithmeticExpression.number(2))
    }
    
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case mutiplication(ArithmeticExpression, ArithmeticExpression)
        
    }
    
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    
    
    var sum: ArithmeticExpression?
    var product: ArithmeticExpression?
    
    func evalute(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(number):
            return number
        case let .addition(left, right):
            return evalute(_:left) + evalute(_:right)
        case let .mutiplication(left, right):
            return evalute(_:left) + evalute(_:right)
        }
    }
    
}
