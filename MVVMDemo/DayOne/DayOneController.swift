//
//  DayOneController.swift
//  MVVMDemo
//
//  Created by Li, Havi X. -ND on 7/22/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class DayOneController: UIViewController {
    
    let disposeBag = DisposeBag()

    lazy var button: UIButton = {
        let buttonCreate = UIButton.init(type: UIButtonType.custom)
        buttonCreate.setTitle("tapme", for: UIControlState.normal)
        buttonCreate.frame = CGRect.init(x: 10, y: 100, width: 100, height: 25)
        buttonCreate.setTitleColor(UIColor.red, for: UIControlState.normal)
        return buttonCreate
    }()
    
    lazy var textFileOne: UITextField = {
        let text = UITextField.init(frame: CGRect.init(x: 10, y: 125, width: 200, height: 44))
        text.borderStyle = UITextBorderStyle.roundedRect
        text.placeholder = "1"
        return text
    }()
    
    lazy var textFileTwo: UITextField = {
        
        let text = UITextField.init(frame: CGRect.init(x: 10, y: 175, width: 200, height: 44))
        text.borderStyle = UITextBorderStyle.roundedRect
        text.placeholder = "1"
        return text
    }()
    
    lazy var textFileThree: UITextField = {
        
        let text = UITextField.init(frame: CGRect.init(x: 10, y: 225, width: 200, height: 44))
        text.borderStyle = UITextBorderStyle.roundedRect
        text.placeholder = "1"
        return text
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 275, width: 200, height: 44))
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.white
        setUpui()
        observerAllTextField()
    }
    
    func setUpui() {
        view.addSubview(button)
        view.addSubview(textFileOne)
        view.addSubview(textFileTwo)
        view.addSubview(textFileThree)
        view.addSubview(resultLabel)
    }
    
    func observerAllTextField() {
        _ = textFileOne.rx.text.orEmpty.asObservable()
            .filter({
                $0 != ""
            })
            .subscribe({ (inputString) in
                print("input:\(inputString)")
            })
            .disposed(by: disposeBag)
        
        _ = Observable
            .combineLatest(textFileOne.rx.text.orEmpty, textFileTwo.rx.text.orEmpty, textFileThree.rx.text.orEmpty, resultSelector: { (text1, text2, text3) -> String in
                return "\((Int(text1) ?? 0) + (Int(text2) ?? 0) + (Int(text3) ?? 0))"
            })
            .map({
                $0.description
            })
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
