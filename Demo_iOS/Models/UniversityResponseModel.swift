//
//  UniversityResponseModel.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation

struct UniversityModel {
    var alphaTwoCode: String
    var domains: [String]
    var name: String
    var webPages: [String]
    var country: String
    var stateProvince: String?

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains
        case name
        case webPages = "web_pages"
        case country
        case stateProvince = "state-province"
    }
}
