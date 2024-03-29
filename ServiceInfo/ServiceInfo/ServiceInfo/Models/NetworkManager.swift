//
//  NetworkManager.swift
//  ServiceInfo
//
//  Created by Arseniy Apollonov on 29.03.2024.
//

import Foundation

class NetworkManager {
    
    private let baseURL = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
    
    func getAllApps(_ complitionHandler: @escaping (Root) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Something goes wrong with error: \(String(describing: error))")
                return
            }
            guard let responseData = data else { return }
            let appsData = try? JSONDecoder().decode(Root.self, from: responseData)
            complitionHandler(appsData ?? Root(body: Services(services: []), status: 0))
        }.resume()
    }
}
