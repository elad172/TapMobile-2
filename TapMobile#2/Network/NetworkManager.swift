//
//  NetworkManager.swift
//  TapMobile#2
//
//  Created by Elad on 21/02/2021.
//

import Foundation

class NetworkManager {
    
    enum NetworkError: Error {
        case decodeFailure
        case generalError
        case invalidUrl
    }
    
    static func request<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
//                print(String(decoding: data, as: UTF8.self))
                do {
                    let stringVal = String(decoding: data, as: UTF8.self)
                    print(stringVal)
                    let regex = try NSRegularExpression(pattern: "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)", options: NSRegularExpression.Options.caseInsensitive)
                    let match = regex.firstMatch(in: stringVal, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, stringVal.utf16.count))
                    let range = match?.range(at: 0)
                    let youTubeID = (stringVal as NSString).substring(with: range!)
                    print(youTubeID)
                } catch {
                }
                do {
                    let decoder = JSONDecoder()
                    let validResponse = try decoder.decode(T.self, from: data)
                    completion(.success(validResponse))
                } catch {
                    completion(.failure(.decodeFailure))
                }
            }
            else {
                completion(.failure(.generalError))
            }
        }.resume()
    }
}
