//
//  ViewController.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/07.
//

import UIKit
var accountList : [AccountBookList] = []

class ViewController: UIViewController{
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate = self -> 제스쳐, UI
        tableView.delegate = self
        // DataSource = self -> 데이터관리
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        
        //초기 데이터
        accountList.append(AccountBookList(image: #imageLiteral(resourceName: "chart"),  type: "쇼핑" , memo: "수빈이랑 쇼핑", price: "5000원", date: "2020.02.25"))
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as? AccountTableViewCell else{
            return UITableViewCell()
        }
        let accountBookList : AccountBookList = accountList[indexPath.row]
        cell.uiImage.image = accountBookList.image
        cell.uiType.text = accountBookList.type
        cell.uiMemo.text = accountBookList.memo
        cell.uiPrice.text = accountBookList.price
        cell.uiDate.text = accountBookList.date
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
        performSegue(withIdentifier: "DetailView", sender: self)
    }
}
