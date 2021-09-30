//
//  Address.swift
//  PromosTestTask
//
//

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}
