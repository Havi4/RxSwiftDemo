//
//  RxDemoOneDay.swift
//  MVVMDemo
//
//  Created by Li, Havi X. -ND on 7/22/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class RxDemo {
    
    init() {
        
        let disposeBag = DisposeBag()
        let loginButton: UIButton = UIButton.init(type: UIButtonType.custom)
        
        _ = Observable<String>
            .create({ (observableString) -> Disposable in
                return Disposables.create()
            })
            .subscribe({ (event) in
                print(event)
            })
        
        let observableButton = loginButton.rx.tap.asObservable()
        let observableString = Observable<String>.create { (observableString) -> Disposable in
            observableString.onNext("next")
            observableString.onCompleted()
            return Disposables.create()
            }
        observableString.subscribe{ (event) in
            print("ond")
        }.disposed(by: disposeBag)
        
        let neverSequence = Observable<String>.never()
        _ = neverSequence.subscribe { (event) in
            print("this will never run")
        }.disposed(by: disposeBag)
        
        _ = Observable<Int>
            .empty()
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        
        _ = Observable<String>
            .just("hello")
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        _ = Observable
            .of("dog","cat","rabbit","horse")
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        
        _ = Observable
            .range(start: 1, count: 10)
            .subscribe({ (num) in
                print(num)
            })
            .disposed(by: disposeBag)
        
        _ = Observable
            .repeatElement("repeatElement")
            .take(3)
            .subscribe({ (num) in
                print(num)
            })
            .disposed(by: disposeBag)
        
        _ = Observable
            .generate(initialState: 0, condition: { (num) -> Bool in
                num > 3
            }, iterate: {
                $0 + 1
            })
            .subscribe({ (num) in
                print(num)
            })
            .disposed(by: disposeBag)
        
        _ = Observable<String>
            .deferred({ () -> Observable<String> in
                return Observable.create({ (observable) -> Disposable in
                    observable.onNext("dog")
                    return Disposables.create()
                })
            })
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        
        let subject = PublishSubject<String>()
        subject.onNext("ai")
        
        let relaySubject = ReplaySubject<String>.createUnbounded()
        //合并多个序列
        _ = Observable
            .of("a","b", "c", "d")
            .startWith("1")
            .startWith("2")
            .subscribe({ (ele) in
                print(ele)
            })
            .disposed(by: disposeBag)
        
        //merge 操作，将多个sequence进行合并，然后按照先后顺序执行。
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()
        
        _ = Observable
            .of(subject1, subject2)
            .merge()
            .subscribe({ (ele) in
                print(ele)
            })
            .disposed(by: disposeBag)
        
        subject1.onNext("A")
        subject1.onNext("B")
        subject2.onNext("1")
        subject2.onNext("2")
        subject1.onNext("AB")
        subject2.onNext("3")
        print("--------------")
        let subject3 = PublishSubject<String>()
        let subject4 = PublishSubject<String>()
        //zip 配对，没有配对的丢弃
        _ = Observable
            .zip(subject3, subject4)
            .subscribe({ (ele) in
                print(ele)
            })
            .disposed(by: disposeBag)
        subject3.onNext("A")
//        subject3.onNext("B")
//        subject3.onNext("C")
        subject4.onNext("1")
        subject4.onNext("2")
        subject4.onNext("3")
        //
        
        print("--------------")
        let subject5 = PublishSubject<String>()
        let subject6 = PublishSubject<String>()
        //zip 配对，没有配对的丢弃
        _ = Observable<String>
            .combineLatest(subject5, subject6, resultSelector: { (ele1, ele2) -> String in
                "\(ele1)"
            })
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        subject5.onNext("A")
        subject5.onNext("B")
        subject5.onNext("C")
        subject6.onNext("1")
        subject6.onNext("2")
        subject6.onNext("3")
        
        _ = Observable<String>
            .of("1", "2", "3")
            .map({ (ele) -> String in
                ele + ele
            })
            .subscribe({ (event) in
                print(event)
            })
            .disposed(by: disposeBag)
        
    }
    
}
