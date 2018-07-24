//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Li, Havi X. -ND on 7/19/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    
    let disposeBag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.frame = self.view.frame
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        bindTableView()
    }
    
    func addTableView() {
        view.addSubview(tableView)
    }
    
    func bindTableView() {
        let items = Observable.just(["DayOneController"].map {"\($0)" })
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){ (row, element, cell) in
                cell.textLabel?.text = "\(element)"
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(String.self).subscribe(onNext: {
                print("tap index: \($0)")
                let viewController = DayOneController()
                self.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
    }


}

