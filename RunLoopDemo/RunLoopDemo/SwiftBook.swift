//
//  SwiftBook.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/13/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

class SwiftBook: NSObject {
    let possibleString: String? = "possibleString"
    let forceString: String! = "forceString"
    
    override init() {
        if forceString != nil {
            print("success")
        }
        super.init()
        setOptionalValue()
        rangeOperater()
        stringIndices()
    }
    
    fileprivate func setOptionalValue() {
        let optionalValue: String? = "optionalValue"
        let optionalInt: Int? = 1
        if let testOptional = optionalValue, let testOptionalInt = optionalInt {
            print("yes-it-has value\(testOptional)\(testOptionalInt)")
        } else {
            print("no value")
        }
        
    }
    
    //error hander
    func fucnErrorHanding() throws -> Int? {
        let a = ["li","wang"]
        let s = a[3]
        return 1;
    }
    
    func rangeOperater() {
        for i in 1...5 {
            print("index is:\(i)")
        }
        
        for index in 1..<5 {
            print("index is:\(index)")
        }
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for name in 0..<count {
            print("print-name:\(names[name])")
        }
        
        for name in names {
            print("print-name:\(name)")
        }
        
        for name in names[0...2] {
            print("print-name:\(name)")
        }
        
        let mutibleString = """
this is
mutiable String
haha
"""
        let mutibleString1 = """
            this\
            hah
            """
        
    }
    
    func swiftString() {
        var emptyString = ""
        var anotherEmptyString = String()
        if emptyString.isEmpty {
            print("now-string-is-empty")
        }
        
        var variableString = "Hourse"
        variableString += "and carriade"
        print("this name is\(variableString)")
        
        
    }
    
    func stringIndices() {
        var indexString = "testIndexString"
        indexString[indexString.startIndex]
        let indexedString = indexString.index(indexString.startIndex, offsetBy: 7)
        let a = indexString.substring(to: indexedString)
        print("\(indexedString)")
        print(indexString.startIndex)
        
        print(indexString.indices)
        
        for index in indexString.indices {
            print("\(indexString[index])")
        }
        
        let range = indexString.index(indexString.endIndex, offsetBy: -6)..<indexString.endIndex
        indexString.removeSubrange(range)
        
        let romeoAndJuliet = ["act","bct","cct"]
        for secne in romeoAndJuliet {
            if secne.hasPrefix("a") {
                print(secne)
            }
        }
        
    }
    
    func demoArr() {
        var someInt = [Int]()
        let nameArr: [Int] = [3,5,6]
        for (index, value) in nameArr.enumerated() {
            print("index:\(index),value:\(value)")
        }
    }
    
    func testFunctionType() {
        var mathFunction: (Int, Int) -> Int = addMethod
        
        mathFunction(1, 2)
    }
    
    func addMethod(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("math result:\(mathFunction(a, b))")
    }
    
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    
    func demoFunctionType() {
        var currentValue = 3
        let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
        print("counting to zero...")
        while currentValue > 0 {
            print("current value:\(currentValue)")
            currentValue = moveNearToZero(currentValue)
        }
        
    }
}


