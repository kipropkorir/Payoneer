//
//  DayViewModelTests.swift
//  SweaterWeather
//
//  Created by Collins Korir on 31/05/2021.
//

import XCTest
import UIKit
@testable import Collins

class PaymentMethodsTests: XCTestCase {
    
    var viewModel: DayViewModel!

    override func setUpWithError() throws {
        let data = loadStub(name: "PaymentMethodsData", extenson: "json")
        
        let decoder = JSONDecoder()
        let currentWeatherResponse = try! decoder.decode(CurrentWeather.self, from: data)
        
        viewModel = DayViewModel(currentWeatherData: currentWeatherResponse.current, currentWind: currentWeatherResponse.wind, todaysWeather: currentWeatherResponse.weather, currentLoaction: currentWeatherResponse.locationName)
    }
    
    func testLogo() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataReference = UIImage(named: "logo")!.pngData()!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 100.0)
        XCTAssertEqual(viewModelImage!.size.height, 100.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

}
