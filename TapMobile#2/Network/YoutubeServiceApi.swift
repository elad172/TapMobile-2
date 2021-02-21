//
//  YoutubeServiceApi.swift
//  TapMobile#2
//
//  Created by Elad on 21/02/2021.
//

import Foundation

class YoutubeServiceApi {
    
    //MARK: - Consts
    //https://www.youtube.com/results?search_query=ronaldo
    private struct Consts {
        static let baseUrl = "https://www.youtube.com/"
        static let searchPath = "results?search_query="
    }
    //MARK: - Public
    func youtubeSearch(for value: String, completion: @escaping (Result<Res, NetworkManager.NetworkError>) -> ())  {
        guard let validUrl = URL(string: Consts.baseUrl + Consts.searchPath + value) else {
            print("invalid url")
            return
        }
        
        NetworkManager.request(url: validUrl, completion: completion)
    }
    
    init() {
        youtubeSearch(for: "ronaldo") { result in
            switch result {
            case .success(let res):
                print(res)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct Res: Decodable {
    let name: String
}
