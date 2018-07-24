//
//  DayTwoDemo.swift
//  MVVMDemo
//
//  Created by Li, Havi X. -ND on 7/23/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import Dispatch
import RxSwift
import RxCocoa
//import Darwin

protocol ContainerVable {
    associatedtype E
    
    func addName()
}

extension ContainerVable {
    func addNum(_ num: Int) -> Int {
        return num + 5
    }
}

extension Int: ContainerVable {
    typealias E = Int
    
    
    func addName() {
        print("aaaa")
    }
    
    func addNum(_ num: Int) -> Int {
        return num + 10
    }
}

class TestDemo {
    
//    private static var isScheduleKey: pthread_key_t = {
//        let key = UnsafeMutablePointer<pthread_key_t>.allocate(capacity: 1)
//        return
//    }()
    
    init() {
        let a: Int = 7
        a.addName()
        a.addNum(9)
    }
    
    func testDemo() {
        
    }
}
