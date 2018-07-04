//
//  KRIphoneNumberVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/21.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit
private let cellId = "KRiPhoneNumberCell"
class KRIphoneNumberVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "联系人列表"
        
        loadData { [weak self] list in
            self?.personList = list
            self?.tableView.reloadData()
        }
        
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = rightBtn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

//MARK: - UITableView Delegate and DataSource

extension KRIphoneNumberVC:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:KRiPhoneNumberCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! KRiPhoneNumberCell
        cell.model = personList[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = KRIPhoneDetailVC()
        vc.model = personList[indexPath.item]
        vc.completionCallBlock = {
            [weak self] in
              self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - LoadData

extension KRIphoneNumberVC {
    fileprivate func loadData(completion:@escaping (_ list:[Person]) -> ()) ->() {
        
        
        DispatchQueue.global().async {
            var arrayM = [Person]()
            
            for i in 0..<20 {
                let phone = "1860" + String(format: "%06d", arc4random_uniform(1000000))
                
                let p = Person.init(name: "Zhangsan -\(i)", phone: phone, title: "boss")
                arrayM.append(p)
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute: {
                completion(arrayM)
            })
             
        }
        
    }
}

//MARK: - navAddBtn

extension KRIphoneNumberVC {
    fileprivate func rightBtn() -> (UIBarButtonItem?) {
        let btn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(rightAction))
        return btn
    }
    
    
    @objc fileprivate func rightAction() {
        let vc = KRIPhoneDetailVC()
        
        vc.completionCallBlock = {
            [weak self] in
            guard let p = vc.model else {return}
            
            self?.personList.insert(p, at: 0)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
