//
//  MainModel.swift
//  ServiceInfo
//
//  Created by Arseniy Apollonov on 29.03.2024.
//

import UIKit

struct Root: Codable {
    var body: Services
    var status: Int
}

struct Services: Codable {
    var services: [Result]
}

struct Result: Codable {
    var name: String
    var description: String
    var link: String
    var icon_url: String
}
