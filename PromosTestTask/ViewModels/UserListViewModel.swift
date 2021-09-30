//
//  UserListViewModel.swift
//  PromosTestTask
//
//

import Foundation

enum SortType {
    case id
   case userName
}

protocol UserListViewModelProtocol: AnyObject  {
    
    var users: [User] { get }
    var bindViewModelToController : (() -> ()) { get set}
    
    func fetchUsers()
    func sortUser(sort by: SortType)
}


class UserListViewModel: UserListViewModelProtocol {
    
    let apiService: APIServiceProtocol
    
    var isLoading = false
    
    private(set) var users: [User] = [] {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers() {
        self.isLoading = true
        apiService.getUsers {[weak self] result in
            self?.isLoading = true
            switch result {
            case .success(let users):
                self?.users = users?.sorted{$0.username < $1.username} ?? []
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func sortUser(sort by: SortType) {
        if by == .userName {
          users = users.sorted{$0.username < $1.username}
        } else {
            users = users.sorted{$0.id < $1.id}
        }
        bindViewModelToController()
    }
    
}
