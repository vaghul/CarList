//
//  HelperNetworkservice.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//


import UIKit

public enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
    case decodeErrorKeyNA
    case decodeErrorValueNA
    case decodeErrorTypeNA
    case decodeErrorDataNA
    case connectivityIssue
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
}
struct EmptyRequest: Codable {}

// Custom Network Service Handler Result Type

class HelperNetworkService {
    
    public static let shared = HelperNetworkService()
    
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
   private func buildRequest<E: Encodable>(url: URL, method: HTTPMethod, headers: [String: String]?, body: E?) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        if let requestHeaders = headers {
            for (key, value) in requestHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        if let requestBody = body {
            if !(requestBody is EmptyRequest) {
                let encoder = JSONEncoder();
                request.httpBody = try? encoder.encode(requestBody)
            }
        }
        return request
    }
    
    func fetchResources<T: Decodable, E:Encodable>(url: URL?, method:HTTPMethod, params : [String:Any]?,body:E?, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard var urlConstruct = url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlConstruct = urlConstruct.addParams(params: params)
    
        var request = self.buildRequest(url: urlConstruct, method: method, headers: [:], body: body)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringCacheData
        urlSession.dataTask(with: request) { (result) in
            switch result {
            case .success(let (response, data)):

                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    print((response as? HTTPURLResponse)?.statusCode ?? "NA")
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch let DecodingError.dataCorrupted(context) {
                       print(context)
                        completion(.failure(.decodeErrorDataNA))
                   } catch let DecodingError.keyNotFound(key, context) {
                       print("Key '\(key)' not found:", context.debugDescription)
                       //print("codingPath:", context.codingPath)
                       completion(.failure(.decodeErrorKeyNA))
                   } catch let DecodingError.valueNotFound(value, context) {
                       print("Value '\(value)' not found:", context.debugDescription)
                     //  print("codingPath:", context.codingPath)
                       completion(.failure(.decodeErrorValueNA))
                   } catch let DecodingError.typeMismatch(type, context)  {
                       print("Type '\(type)' mismatch:", context.debugDescription)
                        // print("codingPath:", context.codingPath)
                       completion(.failure(.decodeErrorTypeNA))
                   } catch {
                       print("error: ", error)
                      completion(.failure(.decodeError))
                   }
            case .failure(let error):
                if error._domain == "NSURLErrorDomain" {
                    completion(.failure(.connectivityIssue))
                }else{
                    completion(.failure(.apiError))
                }
            }
        }.resume()
        urlSession.finishTasksAndInvalidate()
    }
    
}
