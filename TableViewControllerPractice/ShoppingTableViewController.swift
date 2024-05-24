//
//  ShoppingTableViewController.swift
//  TableViewControllerPractice
//
//  Created by 박성민 on 5/24/24.
//

import UIKit
struct Shopping {
    let title: String
    var check: Bool = false
    var star: Bool = false
}
class ShoppingTableViewController: UITableViewController {

    @IBOutlet var realView: UIView!
    @IBOutlet var headView: UIView!
    @IBOutlet var serachTextField: UITextField!
    
    @IBOutlet var addButton: UIButton!
    var list = [
        Shopping(title: "그립톡 구매"),
        Shopping(title: "사이다 구매"),
        Shopping(title: "아이패드 케이스 최저가 알아보기"),
        Shopping(title: "양말"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeadView()
        tableView.rowHeight = 60

    }
    func setHeadView() {
        headView.backgroundColor = .clear
        realView.backgroundColor = .white
        realView.layer.cornerRadius = 10
        
        serachTextField.placeholder = "무엇을 구매하실 건가요?"
        serachTextField.backgroundColor = .white
        serachTextField.borderStyle = .none
        
        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        addButton.backgroundColor = .lightGray
        addButton.layer.cornerRadius = 10
        addButton.tintColor = .black
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        let data = list[indexPath.row]
        let checkImage = data.check ? "checkmark.square.fill" : "checkmark.square"
        let starImage = data.star ? "star.fill" : "star"
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.starButton.setImage(UIImage(systemName: starImage), for: .normal)
        cell.checkButton.tintColor = .black
        cell.starButton.tintColor = .black
        cell.title.text = data.title
        cell.title.font = .systemFont(ofSize: 13)
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)

        return cell
    }
    func saveText() {
        guard let text = serachTextField.text else {return}
        if !text.isEmpty && text.count >= 2 {
            list.append(Shopping(title: text))
            tableView.reloadData()
            serachTextField.text = ""
        }
    }
    @IBAction func serachTextFieldDidEnd(_ sender: UITextField) {
        saveText()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        saveText()
    }
    
}
extension ShoppingTableViewController {
    @objc func checkButtonTapped(sender: UIButton) {
        list[sender.tag].check.toggle()
        tableView.reloadData()
        //tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        //print(sender.tag)
    }
    @objc func starButtonTapped(sender: UIButton) {
        list[sender.tag].star.toggle()
        tableView.reloadData()
        //tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        //print(sender.tag)
    }
    
}
