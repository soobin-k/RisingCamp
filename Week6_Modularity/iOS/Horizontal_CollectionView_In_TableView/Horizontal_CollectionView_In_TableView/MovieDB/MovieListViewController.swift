//
//  MovieListViewController.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/29.
//
import UIKit
import Foundation
import XLPagerTabStrip

class MovieListViewController: UIViewController,IndicatorInfoProvider , UICollectionViewDelegate, CollectionViewCellDelegate{
    
    lazy var dataManager: MovieDBDataManager = MovieDBDataManager()
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableview
        setupTableView()
        
        //Request Movie DB
        self.showIndicator()
        dataManager.searchMovieDBList(targetDt: "popular", delegate: self)
        print("무비 리스트\(movies)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        tableView.reloadData()
        print("무비 리스트\(movies)")
    }
    
    //상단 탭바 연결
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "영화 목록")
    }
    
    //상세 페이지로 넘어가기
    func collectionView(collectionviewcell: PopularCollectionViewCell?, index: Int, didTappedInTableViewCell: PopularTableViewCell) {
        print("어쩌구")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        /*
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)*/
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//Nextwork
extension MovieListViewController {
    func didRetrieveBoxOffice(result: [Movie]) {
        self.dismissIndicator()
        movies = result
        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}


// 테이블뷰 extension
extension MovieListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell") as? PopularTableViewCell else{
            return UITableViewCell()
        }
        
        cell.cellDelegate = self
        cell.setCell(row: movies)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 312
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
        
            let curatingCellNib = UINib(nibName: "PopularTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "PopularTableViewCell")
        
            // #2 #3
        /*
            let newsLetterCellNib = UINib(nibName: "NewsLetterCell", bundle: nil)
            self.tableView.register(newsLetterCellNib, forCellReuseIdentifier: "NewsLetterCell")
            // #4
            let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
            self.tableView.register(categoryCellNib, forCellReuseIdentifier: "CategoryCell")*/
    }
}
