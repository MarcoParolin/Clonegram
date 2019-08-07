//
//  User.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

public class User {
    public let gender: Gender
    public let name: (title: String, first: String, last: String)
    public var fullName: String {
        return "\(self.name.first.capitalized) \(self.name.last.capitalized)"
    }
    public var fullNameWithTitle: String {
        return "\(self.name.title.capitalized). \(self.name.first.capitalized) \(self.name.last.capitalized)"
    }
    public let location: (street: String, city: String, state: String, postcode: String)
    public var address: String {
        return "\(self.location.street), \(self.location.city), \(self.location.state)"
    }
    public let email: String
    public let birthday: (date: Date, age: Int)
    public let username: String
    public let registered: (date: Date, age: Int)
    public let phone: (home: String, cell: String)
    public let id: (name: String, value: String)
    public let picture: (large: String, medium: String, thumb: String)
    public let nationality: Nationality?
    public var flag: String {
        return self.nationality?.asFlag ?? ""
    }
    public var nationName: String {
        return self.nationality?.asName ?? ""
    }
    
    init(data: Result) {
        self.gender = data.gender
        self.name = (title: data.name.title, first: data.name.first, last: data.name.last)
        self.location = (street: data.location.street, city: data.location.city, state: data.location.state, postcode: data.location.postcode)
        self.email = data.email
        self.birthday = (date: data.dob.dateParsed, age: data.dob.age)
        self.registered = (date: data.registered.dateParsed, age: data.registered.age)
        self.phone = (home: data.phone, cell: data.cell)
        self.id = (name: data.id.name ?? "", value: data.id.value ?? "")
        self.picture = (large: data.picture.large, medium: data.picture.medium, thumb: data.picture.thumbnail)
        self.nationality = Nationality(rawValue: data.nat)
        self.username = data.login.username
    }
}
