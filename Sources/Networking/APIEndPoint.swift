//
// APIEndPoint.swift
//  News App
//
//  Created by Jigar Shethia on 29/03/24.

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol APIEndPoint: URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var shouldCache: Bool { get }
    var parameters: [String: Any] { get }
    var headers: [String: String]? { get }
}

extension APIEndPoint {
    
   public var headers: [String: String]? {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
}

