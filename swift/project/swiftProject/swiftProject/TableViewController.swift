//
//  TableViewController.swift
//  02-CustomFont
//
//  Created by AlbertHuang on 2018/2/1.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let resetData:[String] = ["Counter", "NowTime", "PlayVideo", "Refresh","CollectionView","Iphone","GCD","MVC","Rx"]
    private var localData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        localData = resetData
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetAction(_ sender: Any) {
        localData = resetData
        tableView.reloadData()
    }
    
    @IBAction func editAction(_ sender: Any) {
        self.isEditing = !self.isEditing;
    }

    // MARK: - Table view Data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return localData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

        if let tempLabel = cell.textLabel {
            tempLabel.text  = localData[indexPath.row]
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            localData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
   
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = localData[sourceIndexPath.row]
        localData.remove(at: sourceIndexPath.row)
        localData.insert(itemToMove, at: destinationIndexPath.row)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "ViewController")
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let vc = TimeVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = PlayVideoListVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 3 {
            let vc = RefreshListVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 4 {
            let vc = KRCollectionVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 5 {
            let vc = KRIphoneNumberVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 6 {
            let vc = GCDVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 7 {
            let vc = ToDoListVC()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 8 {
            let vc = RxTableVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

