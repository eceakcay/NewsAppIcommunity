//
//  NewsService.swift
//  News
//
//  Created by Ece Akcay on 25.12.2025.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchTopNews(
        country: String,
        page:Int,
        pageSize:Int,
        completion: @escaping (Result<NewsModel, NetworkError>) -> Void
    )
}

final class NewsService {
    
    private let networkManager: NetworkManagerProtocol
    
    init(NetworkManager: NetworkManagerProtocol = NetworkManager() ) {
        self.networkManager = NetworkManager
    }
    
}

extension NewsService: NewsServiceProtocol {
    func fetchTopNews(
        country: String,
        page:Int,
        pageSize:Int,
        completion: @escaping (Result<NewsModel, NetworkError>) -> Void
    ) {
        var urlComponents = URLComponents(string: NetworkConstants.baseURL + "top-headlines")
        urlComponents?.queryItems = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "apiKey", value: NetworkConstants.apiKey)
        ]
        
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidRequest))
            return
        }
        
        networkManager.request(
            url: url,
            method: .GET,
            completion: completion
        ) 
    }
    
}
