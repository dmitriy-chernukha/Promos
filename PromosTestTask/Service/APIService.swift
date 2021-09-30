//
//  APIService.swift
//  PromosTestTask
//
//

import Foundation

protocol APIServiceProtocol {
    func getUsers(completionBlock: @escaping (Result<[User]?, Error>) -> Void)
}

class MockAPIService : APIServiceProtocol {

    
    func getUsers(completionBlock: @escaping (Result<[User]?, Error>) -> Void) {
        completionBlock(.success(
            [
                User(id: 1, name: "B", username: "B"),
                User(id: 0, name: "A", username: "A")
            ]
        ))
    }
}

class APIService : APIServiceProtocol {
    
    private let sourcesURL = "https://jsonplaceholder.typicode.com/users"
    
    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    func getUsers(completionBlock: @escaping (Result<[User]?, Error>) -> Void) {
        guard let url = URL(string: sourcesURL) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }
            
            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let usersData = try jsonDecoder.decode([User].self, from: responseData)
                completionBlock(.success(usersData))
            } catch let error {
                completionBlock(.failure(error))
            }
        }
        task.resume()
    }
}
