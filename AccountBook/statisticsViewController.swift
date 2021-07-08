//
//  statisticsViewController.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/09.
//

import Charts
import UIKit
import Foundation
class statisticsViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    var buyPrice: [Double]!
    let pieType = ["지출", "수입"]
    var piePrice: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        buyPrice = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        piePrice = [0.0, 0.0]
        
        for (_, value) in expendList.storage.enumerated(){
            buyPrice[value.type] += Double(value.price)!
            piePrice[0] += Double(value.price)!
        }
        for (_, value) in incomeList.storage.enumerated(){
            buyPrice[value.type] += Double(value.price)!
            piePrice[1] += Double(value.price)!
        }
                barChartView.noDataText = "데이터가 없습니다."
                barChartView.noDataFont = .systemFont(ofSize: 20)
                barChartView.noDataTextColor = .lightGray
                
                setChart(dataPoints: buyType, values: buyPrice)
                setPieChart(dataPoints: pieType, values: piePrice)
    }
    func setChart(dataPoints: [String], values: [Double]) {
          
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "금액")

        // 차트 컬러
        chartDataSet.colors = [.systemGreen]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        // 선택 안되게
        chartDataSet.highlightEnabled = false
        // 줌 안되게
        barChartView.doubleTapToZoomEnabled = false


        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: buyType)

        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false
        
        // 기본 애니메이션
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        // 옵션 애니메이션
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)

        // 리미트라인
        //let ll = ChartLimitLine(limit: 10.0, label: "타겟")
        //barChartView.leftAxis.addLimitLine(ll)

        // 맥시멈
        //barChartView.leftAxis.axisMaximum = 30
        // 미니멈
        //barChartView.leftAxis.axisMinimum = -10
        
        // 백그라운드컬러
        //barChartView.backgroundColor = .yellow
        }
    
    func setPieChart(dataPoints: [String], values: [Double]){
        // 1. Set ChartDataEntry
          var dataEntries: [ChartDataEntry] = []
          for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
          // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
          pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
          // 3. Set ChartData
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
          let format = NumberFormatter()
          format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
          // 4. Assign it to the chart’s data
          pieChartView.data = pieChartData
    }
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        //랜덤 컬러
        //let red = Double(arc4random_uniform(256))
        //let green = Double(arc4random_uniform(256))
        //let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(255/255), green: CGFloat(0), blue: CGFloat(0), alpha: 1)
        colors.append(color)
        let color2 = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(255/255), alpha: 1)
        colors.append(color2)
      }
      return colors
    }
   
}

