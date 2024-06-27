//
//  NetworkService.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import Foundation

struct RoverService {
    
    static let shared = RoverService()
    
    /// Privatized constructor
    private init() {}
    
    func fetchRovers<T: Decodable>(expecting type: T.Type, completion: @escaping (Result<[Rovers], Error>) -> Void) {
        guard let url = URL(string: "https://mars-photos.herokuapp.com/api/v1/rovers") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(GetAllRoversResponse.self, from: data)
                completion(.success(response.rovers))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchLatestPhotos<T: Decodable>(for roverName: String, expecting type: T.Type, completion: @escaping (Result<[ImageData], Error>) -> Void) {
            let urlString = "https://mars-photos.herokuapp.com/api/v1/rovers/\(roverName)/latest_photos"
            guard let url = URL(string: urlString) else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(Images.self, from: data)
                    completion(.success(response.latest_photos))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
}
