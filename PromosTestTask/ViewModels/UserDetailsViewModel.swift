//
//  UserDetailsViewModel.swift
//  PromosTestTask
//
//

import Foundation

protocol UserDetailsViewModelProtocol {
    
    var user: User? { get }
}


class UserDetailsViewModel: UserDetailsViewModelProtocol {
    
    private(set) var user: User?
    
    init(user: User) {
        self.user = user
    }
    
}
