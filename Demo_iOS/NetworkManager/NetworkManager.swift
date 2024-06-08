//
//  NetworkManager.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation

class NetworkManager {
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        let url = URL(string: "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "dataNilError", code: -100001, userInfo: nil)))
                return
            }

            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                completion(.success(universities))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
