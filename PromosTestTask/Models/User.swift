//
//  User.swift
//  PromosTestTask
//
//

struct User: Codable {
    let id: Int
    let name, username: String
    var email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
    

    init(id: Int, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}
