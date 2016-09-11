//
//  APIManager.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import Moya
import Moya_ObjectMapper
import RxSwift
import ObjectMapper


public class APIManager {
    
    static let sharedManager = APIManager()
    public static var disposeBag = DisposeBag()
    
    private init(){}


    /*
     *  MARK: BPI Service
     *
     */
    
    let bitcoinPriceIndexProvider = RxMoyaProvider<BPIService>(plugins:[NetworkLoggerPlugin(verbose: true)])
    
    func getCurrentPrice(onSucess:(response: BitcoinPrice) -> (), onError:(error:ErrorType) -> ()) -> Void {
        bitcoinPriceIndexProvider
            .request(.getCurrentPrice())
            .filterSuccessfulStatusCodes()
            .mapObject(BitcoinPrice)
            .subscribe(onNext: onSucess,
                onError: onError,
                onCompleted: nil,
                onDisposed: nil)
            .addDisposableTo(APIManager.disposeBag)
    }
    
    func getHistoricalData(onSucess:(response: BitcoinPriceHistory) -> (), onError:(error:ErrorType) -> ()) -> Void {
        bitcoinPriceIndexProvider
            .request(.getHistoricalData())
            .filterSuccessfulStatusCodes()
            .mapObject(BitcoinPriceHistory)
            .subscribe(onNext: onSucess,
                onError: onError,
                onCompleted: nil,
                onDisposed: nil)
            .addDisposableTo(APIManager.disposeBag)
    }

    func getHistoricalWithDates(start: String, end: String, onSucess:(response: BitcoinPriceHistory) -> (), onError:(error:ErrorType) -> ()) -> Void {
        bitcoinPriceIndexProvider
            .request(.getHistoricalWithDates(start, end))
            .filterSuccessfulStatusCodes()
            .mapObject(BitcoinPriceHistory)
            .subscribe(onNext: onSucess,
                onError: onError,
                onCompleted: nil,
                onDisposed: nil)
            .addDisposableTo(APIManager.disposeBag)
    }
}