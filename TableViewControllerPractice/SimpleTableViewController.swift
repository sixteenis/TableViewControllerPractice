//
//  SimpleTableViewController.swift
//  TableViewControllerPractice
//
//  Created by 박성민 on 5/23/24.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    var allSetArray = ["공지사항", "실험실", "버전 정보"]
    var privateSetArray = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcArray = ["고객센터/도움말"]
    var selectionArray = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return selectionArray.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return selectionArray[section]
//        switch section {
//        case 0:
//            return selectionArray[section]
//        case 1:
//            return selectionArray[section]
//        case 2:
//            return selectionArray[section]
//        default:
//            
//        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return allSetArray.count
        }else if section == 1{
            return privateSetArray.count
        }else if section == 2 {
            return etcArray.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sung")
        if indexPath.section == 0{
            cell?.textLabel?.text = allSetArray[indexPath.row]
        }else if indexPath.section == 1{
            cell?.textLabel?.text = privateSetArray[indexPath.row]
        }else if indexPath.section == 2{
            cell?.textLabel?.text = etcArray[indexPath.row]
        }
        cell?.textLabel?.font = .systemFont(ofSize: 13)
        return cell!
        
    }
    

}
