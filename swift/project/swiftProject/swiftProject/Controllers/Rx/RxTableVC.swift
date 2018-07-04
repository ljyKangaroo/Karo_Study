//
//  RxTableVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/6/1.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name: \(name) singer: \(singer)"
    }
    
}

struct MusicListViewModel {
    let data = Observable.just([
            Music(name: "无条件", singer: "陈奕迅"),
            Music(name: "你曾是少年", singer: "S.H.E"),
            Music(name: "从前的我", singer: "陈洁仪"),
            Music(name: "在木星", singer: "朴树"),
        ])
    
}

private let cellId = "RxCell"
class RxTableVC: UIViewController {

    lazy var tableView: UITableView = {
     let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 0.7800289989, green: 0.8209953904, blue: 0.8441191316, alpha: 1)
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    let viewModel = MusicListViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: RxCell.self)) { index, music, cell in
            cell.model = music
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Music.self).subscribe { (music) in
            print("you selected music: \(music)")
        }.disposed(by: disposeBag)
        
    
        
        tableView.rx.itemSelected.subscribe { row in
            print("you selected IndexRow: \(String(describing: row.element?.item))")
        }.disposed(by: disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
