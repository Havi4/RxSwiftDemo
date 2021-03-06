//
//  RxNameSpace.swift
//  MVVMDemo
//
//  Created by Li, Havi X. -ND on 7/24/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation

public struct HIReactive<Base> {
    public let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol HIReactiveCompatible {
    associatedtype HICompatibleType
    
    static var hrx: HIReactive<HICompatibleType>.Type { get set }
    
    var hrx: HIReactive<HICompatibleType> { get set }
    
    
}

extension HIReactiveCompatible {
    
    public static var hrx: HIReactive<Self>.Type {
        
        get {
            return HIReactive<Self>.self
        }
        
        set {
            
        }
    }
    
    public var hrx: HIReactive<Self> {
        get {
            return HIReactive(self)
        }
        
        set {
            
        }
    }
}

import class Foundation.NSObject

extension NSObject: HIReactiveCompatible {}
