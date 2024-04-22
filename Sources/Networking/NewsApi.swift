//
//  NewsApi.swift
//  News App
//
//  Created by Jigar Shethia on 29/03/24.
//

import Foundation

public enum NewsApi: APIEndPoint, URLRequestConvertible {
    
    case getNewsFor(type: String)
}

extension NewsApi {
    public var baseURL: URL {
        return URL(string: APIConstants.newsAPIBaseURL)!
    }
    
    public var method: HTTPMethod {
        return .get
    }

    public var shouldCache: Bool {
        return false
    }
    
    public var path: String {
        switch self {
        case .getNewsFor:
            return "/svc/search/v2/articlesearch.json"
        }
    }
    
    public var parameters: [String : Any] {
        switch self {
        case let .getNewsFor(type):
            return [
                "api-key": APIConstants.newsAPIKey,
                "q": type
            ]
        }
    }
}

//MARK: NetworkAPI Constants
public enum APIConstants {
    static let newsAPIBaseURL = "https://api.nytimes.com"
    static let newsAPIKey = "j5GCulxBywG3lX211ZAPkAB8O381S5SM"
    public static let imageBaseURL = "https://www.nytimes.com/"
}
