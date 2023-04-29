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

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        session = Session(configuration: configuration)
    }

    func get(url: URLConstants, parameters: Parameters? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
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

