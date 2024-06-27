//
//  RoverViewModel.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import Foundation

final class RoverViewModel {
    public let name: String
    public let landingDate: String
    public let launchDate: String
    public let status: String
    
    public var imageData: [ImageData] = []
    
    //    MARK - Init
    
    init(name: String, landingDate: String, launchDate: String, status: String) {
        self.name = name
        self.landingDate = landingDate
        self.launchDate = launchDate
        self.status = status
    }
    
    public func fetchRoversImage() {
        RoverService.shared.fetchLatestPhotos(for: self.name, expecting: Images.self) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageData = imageData
            case.failure(let error):
                print(String(describing: error))
            }
            
        }
    }
}
