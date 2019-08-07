//
//  UserService.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import Alamofire

public class UserService {
    
    public static var shared = UserService()
    private init() {}
    
    public func getUsers(page: Int, completion: @escaping ((users: [User], nextPage: Int?)) -> Void, error: @escaping (_ errorResponse: ErrorResponse) -> Void) {
        
        guard let url = NetworkManager.route else {
            return
        }
        
        let parameters: Parameters = [
            "page": String(page),
            "results": "20"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: nil).responseString(completionHandler: { response in
            
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Custom)
                
                guard let data = response.data, let decodedObject = try? decoder.decode(UsersDecoder.self, from: data) else {
                    error(ErrorHelper.error(for: .serializationError, andMessage: "Can't decode response"))
                    return
                }
                
                guard !decodedObject.results.isEmpty else {
                    completion((users: [], nextPage: nil))
                    return
                }
                completion((users: decodedObject.results.asUsers, nextPage: page + 1))
            case let .failure(err):
                error(ErrorHelper.error(for: .unknown, andMessage: err.localizedDescription))
            }
            
        })
    }
}
