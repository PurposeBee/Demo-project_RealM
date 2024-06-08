//
//  University.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var alpha_two_code: String = ""
    var domains = [String]()
    @objc dynamic var name: String = ""
    var web_pages = [String]()
    @objc dynamic var country: String = ""
    @objc dynamic var state_province: String?

    override static func primaryKey() -> String? {
        return "name"
    }

    private enum CodingKeys: String, CodingKey {
        case alpha_two_code, domains, name, web_pages, country, state_province
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        alpha_two_code = try container.decode(String.self, forKey: .alpha_two_code)
        domains = try container.decode([String].self, forKey: .domains)
        name = try container.decode(String.self, forKey: .name)
        web_pages = try container.decode([String].self, forKey: .web_pages)
        country = try container.decode(String.self, forKey: .country)
        state_province = try container.decodeIfPresent(String.self, forKey: .state_province)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(alpha_two_code, forKey: .alpha_two_code)
        try container.encode(Array(domains), forKey: .domains)
        try container.encode(name, forKey: .name)
        try container.encode(Array(web_pages), forKey: .web_pages)
        try container.encode(country, forKey: .country)
        try container.encode(state_province, forKey: .state_province)
    }
}

