//
//  BaseViewController.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 09/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import SwiftChart

class BaseViewController: UIViewController, ChartDelegate {

    @IBOutlet weak var lblCurrentPrice: UILabel!
    @IBOutlet weak var chartView: Chart!
    
    let defaultPrice: String = "Unavailable"
    
    var historicalData: Array<Float>?
    var historicalDataXLabels: Array<String>?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historicalData = Array<Float>()
        historicalDataXLabels = Array<String>()
        
        chartView.delegate = self
        chartView.axesColor = BPColors.secondaryColor()
        chartView.labelColor = BPColors.secondaryColor()
        chartView.bottomInset = 60.0
        
        getHistoricalData()
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getCurrentPrice()
    }
    
    // MARK: Chart delegate
    func didTouchChart(chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerate() {
            if let value = chart.valueForSeries(seriesIndex, atIndex: dataIndex) {
                print("Touched series: \(seriesIndex): data index: \(dataIndex!); series value: \(value); x-axis value: \(x) (from left: \(left))")
            }
        }
    }
    
    func didFinishTouchingChart(chart: Chart) {
        
    }
    
    // MARK: Action Outlets
    @IBAction func btnRefreshPressed(sender: AnyObject) {
        getCurrentPrice()
        getHistoricalData()
    }

    

    
    // MARK: Service calls
    
    func getCurrentPrice() {
        BPHud.show()
        APIManager
            .sharedManager
            .getCurrentPrice({ [weak self] response in
                print("Got current price!")
                if let bpi = response.bpi {
                    let symbol = "<span>\(bpi.symbol!)</span>".html2String ?? ""
                    self?.lblCurrentPrice.text = "\(bpi.rate!)\(symbol)"
                    BPHud.hide()
                } else {
                    self?.lblCurrentPrice.text = self?.defaultPrice
                    BPHud.hide()
                }
                
                },
                             onError: { error in
                                print("Failed to get current price!")
            })
    }
    
    func getHistoricalData() {
        historicalData = Array<Float>()
        historicalDataXLabels = Array<String>()
        chartView.removeSeries()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        APIManager
            .sharedManager
            .getHistoricalWithDates(dateFormatter.stringFromDate(NSDate.dateBySubstractingDays(5)),
                                    end: dateFormatter.stringFromDate(NSDate()),
                                    onSucess: { [weak self] response in
                                        print("Got historical data!")
                                        let bpHistory = response
                                        if let bpi = bpHistory.bpi {
                                            let lastDates = bpi.keys.sort()
                                            for date in lastDates {
                                                
                                                print(date)
                                                self?.historicalDataXLabels?.append(String(date.characters.suffix(5)))

                                                self?.historicalData?.append(bpi[date]!)
                                            }
                                        }
                                        
                                        let series = ChartSeries((self?.historicalData)!)
                                        series.color = BPColors.secondaryColor()
                                        series.area = true
                                        self?.chartView.xLabelsFormatter = { (labelIndex: Int, labelValue: Float) -> String in
                                            return (self?.historicalDataXLabels![labelIndex])!
                                        }
                                        self?.chartView.xLabelsTextAlignment = NSTextAlignment.Center
                                        self?.chartView.yLabelsFormatter = { String(Int(round($1))) + "€" }
                                        self?.chartView.addSeries(series)
                                        self?.chartView.setNeedsDisplay()
                },
                                    onError: { error in
                                        print("Failed to get historical data!")
            })
    }

}

