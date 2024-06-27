//
//  Image.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import Foundation

struct ImageData: Decodable {
    
    let id: Int
    let sol: Int
//    let camera: [Camera]
    let img_src: String
    let earth_date: String
//    let rover: [Rovers]
}
