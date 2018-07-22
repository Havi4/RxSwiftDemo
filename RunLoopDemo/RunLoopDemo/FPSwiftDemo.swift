//
//  FPSwiftDemo.swift
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/12/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit

fileprivate func < <T: Comparable>(l: T?, r: T?) -> Bool {
    switch (l,r) {
    case let (lhs?, rhs?):
        return lhs < rhs
    default:
        return true
    }
}

enum Tier1ExpanderType: CustomStringConvertible
{
    case `default`
    case showButton
    case showAll
    var description: String
    {
        get
        {
            switch self
            {
            case .showButton: return "ShowButton"
            case .showAll: return "ShowAll"
            default: return "Default"
            }
        }
    }
}

class TestDemo: NSObject {
    let tier: Tier1ExpanderType = Tier1ExpanderType.default
    override init() {
        print("\(tier.description)")
        1 < 2
    }
}

protocol FullPageLoaderProtocol: class {
    //internal 默认的
    
    
}

enum Tier1ExpreType {
    case `default`
    case showButton
    case showAll
}

class ExperienceViewController: UIViewController {
    public var dataSource: NSMutableArray?
    var controllerName: String?
    var getString: String {
        get {
            return controllerName!
        }
        set {
            
        }
    }
    
    var computeString: String {
        get {
            return controllerName!
        }
        
        set {
            
        }
    }
    
    lazy var lazyString: String = {
      [weak self] in
        return "li"
    }()
    //lazy 只是在最后的使用的时候会改变这个值。
    
    fileprivate var block: ((Int,String) -> ())?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var a = ["li","wang"]
        a.map {
            $0 + "haha"
        }
        
        
        
    }
    
    func testClouses() {
        self.block = { [weak self] (a: Int, b: String) in
            guard let strongSelf = self else { return }
            strongSelf.dataSource = ["li","wang"]
        }
    }
    
    fileprivate func addKeyObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(testOBjc(_:)), name: NSNotification.Name.init("receiveNoti"), object: nil)
    }
    
    func testOBjc(_ noti: NSNotification) {
        
    }
    
    deinit {
        
    }
    
    
}
