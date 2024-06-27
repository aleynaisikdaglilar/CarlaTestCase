//
//  Rovers.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import Foundation

struct Rovers: Decodable {
    
    let id: Int
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
    let max_sol: Int
    let max_date: String
    let total_photos: Int
    let cameras: [Cameras]
}
