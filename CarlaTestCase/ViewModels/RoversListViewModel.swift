//
//  RoversListViewModel.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import Foundation

class RoversListViewModel: NSObject {
    
    var onUpdate: (() -> Void)?
    
    
    public var rovers: [Rovers] = [] {
        didSet {
            for rover in rovers {
                let viewModel = RoverViewModel(
                    name: rover.name,
                    landingDate: rover.landing_date,
                    launchDate: rover.launch_date,
                    status: rover.status
                    
                )
                cellViewModel.append(viewModel)
            }
        }
    }
    
    
    private var cellViewModel: [RoverViewModel] = []
    
    public func fetchRovers() {
        RoverService.shared.fetchRovers(expecting: GetAllRoversResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let rovers = responseModel
                self?.rovers = rovers
                DispatchQueue.main.async {
                    self?.onUpdate?()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
