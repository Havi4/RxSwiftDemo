//
//  SwiftClosures.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/14/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

class SwiftClosures: NSObject {
    
    override init() {
        super.init()
        closuresName()
    }
    
    func closuresName() {
        let clousesOne = { [] (a: Int, b: Int) -> Int in
            return 1
        }
        
        let digitNames = [0:"zeros",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven",8:"eight",9:"nine"]
        let digitArr = [12, 23, 45]
        
        let strings = digitArr.map { (num) -> String in
            var num = num
            var output = ""
            repeat {
                let index = num % 10
                if let digit = digitNames[index] {
                    output += digit
                }
                num = num / 10
            } while (num > 0)
            return output
        }
        
        print(strings)
    }
    
    func makeIncrementer(forIncrement amout: Int) -> () -> Int {
        var runningTotal = 0
        func incremeter() -> Int {
            runningTotal += amout
            return runningTotal
        }
        return incremeter
    }
    
    func closureDemoTwo() {
        let incremeter = makeIncrementer(forIncrement: 2)
        print(incremeter())
        
    }
    
    var completionHadlers: [() -> Void] = []
    
    func someFunctionWithEscaption(completionHadler: @escaping () -> Void) {//default are not escaping
        completionHadlers.append(completionHadler)
    }
}

class SomeClass {
    var x = 10
    var customInLine = ["chris", "ALiex", "Ewa", "Barry", "Daniella"]
    
    init() {
        let custom = { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.customInLine.remove(at: 0)
        }
        
        print()
    }
    
}
