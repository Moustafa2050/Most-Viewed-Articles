//
//  sessionManager.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import Foundation
import Alamofire


class sessionManager {
    static let shared = sessionManager()
    
    private let session: Session
    private let reachabilityManager = NetworkReachabilityManager()
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        session = Session(configuration: configuration)
    }
    func isConnectedToInternet() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    func get(url: URLConstants, parameters: Parameters? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        if !isConnectedToInternet() {
            let error = NSError(domain: "Internet connection lost", code: -1009, userInfo: nil)
            completion(.failure(error))
            return
        }
        session.request(url.rawValue, method: .get, parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func post(url: String, parameters: Parameters? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        if !isConnectedToInternet() {
            let error = NSError(domain: "Internet connection lost", code: -1009, userInfo: nil)
            completion(.failure(error))
            return
        }
        session.request(url, method: .post, parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

