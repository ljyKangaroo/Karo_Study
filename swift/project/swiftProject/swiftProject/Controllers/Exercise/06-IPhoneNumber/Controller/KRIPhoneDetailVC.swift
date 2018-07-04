//
//  KRIPhoneDetailVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/22.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class KRIPhoneDetailVC: UIViewController {

    var model:Person? {
        didSet {
            guard let name = model?.name
                 ,let number = model?.phone
                 ,let boss = model?.title else {
                    return
            }
            nameTF.text = name
            phoneTF.text = number
            titleTF.text = boss
        }
    }
    
    var completionCallBlock:(() -> ())?
    
    lazy var nameTF: UITextField = {
        let nameTF = UITextField.init()
        nameTF.placeholder = "请输入名字"
        nameTF.font = UIFont.systemFont(ofSize: 16)
        nameTF.borderStyle = .none
        nameTF.backgroundColor = #colorLiteral(red: 0.941426158, green: 0.9615024924, blue: 0.9652767777, alpha: 1)
        return nameTF
    }()
    
    lazy var phoneTF: UITextField = {
        let phoneTF = UITextField.init()
        phoneTF.placeholder = "请输入手机号码"
        phoneTF.font = UIFont.systemFont(ofSize: 16)
        phoneTF.borderStyle = .none
        phoneTF.backgroundColor = #colorLiteral(red: 0.941426158, green: 0.9615024924, blue: 0.9652767777, alpha: 1)
        return phoneTF
    }()
    
    lazy var titleTF: UITextField = {
        let titleTF = UITextField.init()
        titleTF.placeholder = "请输入上司名字"
        titleTF.font = UIFont.systemFont(ofSize: 16)
        titleTF.borderStyle = .none
        titleTF.backgroundColor = #colorLiteral(red: 0.941426158, green: 0.9615024924, blue: 0.9652767777, alpha: 1)
        return titleTF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "联系人明细"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = rightBtn()
        configLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK: - UI

extension KRIPhoneDetailVC {
    fileprivate func configLayout() {
        view.addSubview(nameTF)
        view.addSubview(phoneTF)
        view.addSubview(titleTF)
        
        let topH = (navigationController?.navigationBar.frame.size.height ?? 0) + KRStatusBarHeight
        nameTF.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(topH + 10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        phoneTF.snp.makeConstraints { (make) in
            make.top.equalTo(nameTF.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        titleTF.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTF.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
    }
    fileprivate func rightBtn() -> (UIBarButtonItem?) {

        let customBtn = UIButton.init(type: .custom)
        customBtn.setTitle("保存", for: .normal)
        customBtn.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        customBtn.sizeToFit()
        customBtn.addTarget(self, action: #selector(saveAction) , for: .touchUpInside)
        let btn = UIBarButtonItem.init(customView: customBtn)
        return btn
    }
    @objc fileprivate func saveAction() {
        model == nil ? model = Person.init() : nil
        model?.name = nameTF.text
        model?.phone = phoneTF.text
        model?.title = titleTF.text
        
        completionCallBlock?()
        
        navigationController?.popViewController(animated: true)
    }
}
