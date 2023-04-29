//
//  articlesListViewModel.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import Foundation

import Alamofire

class articlesListViewModel {
    
    // MARK: - Properties
    
    private var sessionManagerInstance: sessionManager
    
    private var articles: [ArticleModel] = []
    
    // MARK: - Initialization
    
    init(session: sessionManager) {
        self.sessionManagerInstance = session
    }
    
    // MARK: - Public Methods
    func fetchArticles(completion: @escaping (Error?) -> Void) {
        sessionManagerInstance.get(url: URLConstants.getMostpopularViewedArticles) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(responseGetArticles.self, from: data)
                    if let results = response.results {
                        self.articles = results
                    } else {
                        print("No results in API response")
                    }
                    completion(nil)
                } catch let error {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }

    func numberOfArticles() -> Int {
        return articles.count
    }
    
    func article(at index: Int) -> ArticleModel {
        return articles[index]
    }
    
}


