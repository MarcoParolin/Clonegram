//
//  UsersDecoder.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

struct UsersDecoder: Codable {
    let results: [Result]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

struct Result: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

struct Dob: Codable {
    let date: String
    let age: Int
    
    var dateParsed: Date {
        return DateFormatter.iso8601Custom.date(from: self.date) ?? Date()
    }
}

public enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    
    public var formatted: String {
        switch self {
        case .female:
            return "Donna"
        case .male:
            return "Uomo"
        }
    }
}

struct ID: Codable {
    let name: String?
    let value: String?
}

struct Location: Codable {
    let street, city, state, postcode: String
    let coordinates: Coordinates
    let timezone: Timezone
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        timezone = try container.decode(Timezone.self, forKey: .timezone)
        
        if let value = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(value)
        } else {
            postcode = try container.decode(String.self, forKey: .postcode)
        }
    }
    
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

enum Postcode: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

struct Timezone: Codable {
    let offset, description: String
}

struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

struct Name: Codable {
    let title, first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
