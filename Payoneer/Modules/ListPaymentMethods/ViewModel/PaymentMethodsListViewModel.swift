//
//  FavouriteViewModel.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import Foundation
import UIKit
import CoreData

class PaymentMethodsListViewModel: NSObject {
    
    enum PaymentMethodsError: Error {
        case notAuthorized
        case noDataAvailable
    }
    
    enum PaymentMethodsDataResult {
        case success(PaymentMethodsResponse)
        case failure(PaymentMethodsError)
    }

    typealias FetchPaymentMethodsCompletion = (PaymentMethodsDataResult) -> Void
    var didFetchPaymentMethodsData: FetchPaymentMethodsCompletion?
    
    override init() {
        super.init()
        fetchPaymentMethods()
    }
    
    //MARK:- private methods
    private func fetchPaymentMethods() {
       
        URLSession.shared.dataTask(with: URL(string: PaymentMethodsService.url)!) {[weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                
                print("Status Code: \(response.statusCode) with response \(response)")
            }
            DispatchQueue.main.async {
                if let _ = error{
                    let result: PaymentMethodsDataResult = .failure(.noDataAvailable)
                    self?.didFetchPaymentMethodsData?(result)
                } else if let data = data {
                    let decoder = JSONDecoder()
                    if #available(iOS 10.0, *) {
                        decoder.dateDecodingStrategy = .iso8601
                    } else {
                        // Fallback on earlier versions
                        decoder.dateDecodingStrategy = .secondsSince1970
                    }
                    do {
                        let response = try decoder.decode(PaymentMethodsResponse.self, from: data)
                        let result: PaymentMethodsDataResult = .success(response)
                        self?.didFetchPaymentMethodsData?(result)
                    } catch {
                        let result: PaymentMethodsDataResult = .failure(.noDataAvailable)
                        self?.didFetchPaymentMethodsData?(result)
                    }
                } else {
                    let result: PaymentMethodsDataResult = .failure(.noDataAvailable)
                    self?.didFetchPaymentMethodsData?(result)
                }
            }
        }.resume()
    }

}
