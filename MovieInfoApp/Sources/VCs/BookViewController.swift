//
//  BookViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/24.
//

import Foundation
import UIKit
import SwiftyJSON

class BookViewController: UIViewController{
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var totalMoney: UILabel!
    var date: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let movieVO = MovieVO.shared
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        movieTitle.text = movieVO.nowPlaying[movieVO.index]["title"].stringValue
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func btnStepper(_ sender: UIStepper) {
        count.text = Int(sender.value).description
        totalMoney.text = String(Int(sender.value) * 10000)
    }
    func changed(){

           let dateformatter = DateFormatter()
           dateformatter.dateStyle = .none
           dateformatter.timeStyle = .short
           date = dateformatter.string(from: datePicker.date)

    }


    @IBAction func btnBuy(_ sender: Any) {
        changed()
        let bookVO = BookVO.shared
        bookVO.movieDate.append(date)
        bookVO.movieTitle.append(movieTitle.text!)
    
        self.navigationController?.popViewController(animated: false)
    }
}
