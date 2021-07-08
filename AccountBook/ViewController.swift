//
//  ViewController.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/07.
//

import UIKit
var accountList : [AccountBookList] = []
let buyType = ["쇼핑","음식","교통","오락","생활","투자", "여행", "월급"]
let buyImage = [ #imageLiteral(resourceName: "online-shopping"),#imageLiteral(resourceName: "food"),#imageLiteral(resourceName: "vehicles"),#imageLiteral(resourceName: "game-controller"),#imageLiteral(resourceName: "house"),#imageLiteral(resourceName: "investment"),#imageLiteral(resourceName: "travel-bag"),#imageLiteral(resourceName: "money")]
class ViewController: UIViewController{
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmented: UISegmentedControl!
    var isAll = true
    var isExtended = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate = self -> 제스쳐, UI
        tableView.delegate = self
        // DataSource = self -> 데이터관리
        tableView.dataSource = self
        
        // 테이블 셀 등록
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        
        //초기 데이터
        accountList.append(AccountBookList(image: buyImage[0],  type: 0 , memo: "수빈이랑 쇼핑", price: "5000", date: "2020.02.25", isExpenditure: true))
        accountList.append(AccountBookList(image: buyImage[7],  type: 7 , memo: "7월 월급", price: "1000000", date: "2021.07.07", isExpenditure: false))
        accountList.append(AccountBookList(image: buyImage[6],  type: 6 , memo: "베트남 여행", price: "1500000", date: "2020.07.07", isExpenditure: true))
        accountList.append(AccountBookList(image: buyImage[2],  type: 2 , memo: "지하철", price: "2000", date: "2021.07.07", isExpenditure: true))
        accountList.append(AccountBookList(image: buyImage[1],  type: 1 , memo: "점심 식사", price: "10000", date: "2021.07.07", isExpenditure: true))
        accountList.append(AccountBookList(image: buyImage[5],  type: 5 , memo: "삼성전자 주식", price: "90000", date: "2021.07.01", isExpenditure: true))
        tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    @IBAction func segmentChanged(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
                isAll = true
            tableView.reloadData()
            }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    // 테이블 뷰가 생성할 행 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return accountList.count
       
        
        //return accountList.count
    }
    // 각 행이 화면에 표현해야 할 내용을 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as? AccountTableViewCell else{
            return UITableViewCell()
        }
        let accountBookList : AccountBookList = accountList[indexPath.row]
       
            cell.uiImage.image = buyImage[accountBookList.type!]
            cell.uiType.text = buyType[accountBookList.type!]
            cell.uiMemo.text = accountBookList.memo!
            cell.uiPrice.text = accountBookList.price! + "원"
            cell.uiDate.text = accountBookList.date
            if (accountList[indexPath.row].isExpenditure!) {
                cell.uiPrice.textColor = .red
            } else {
                cell.uiPrice.textColor = .blue
            }
        
        
        
        
        /*
        cell.uiImage.image = accountBookList.image
        cell.uiType.text = buyType[accountBookList.type!]
        cell.uiMemo.text = accountBookList.memo
        cell.uiPrice.text = accountBookList.price
        cell.uiDate.text = accountBookList.date
        if (accountList[indexPath.row].isExpenditure!) {
            cell.uiPrice.textColor = .red
        } else {
            cell.uiPrice.textColor = .blue
        }
         */
        return cell
    }
    // 클릭 시, 상세보기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
        performSegue(withIdentifier: "DetailView", sender: self)
    }
    //네비게이션 바 값 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if let destination = segue.destination as? DetailViewController {
                destination.list = accountList[(tableView.indexPathForSelectedRow?.row)!]
                destination.indexOfList = (tableView.indexPathForSelectedRow?.row)!
                tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
                
            }
    }
    //스와이프 시, 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                accountList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
    }
    //삭제 버튼 이름 변경
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    
}

