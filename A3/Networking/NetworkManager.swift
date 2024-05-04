//
//  NetworkManager.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import Alamofire
import Foundation

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private init() { }

    /// Endpoint for dev server
    private let devEndpoint: String = "https://chatdev-wuzwgwv35a-ue.a.run.app"
    
    // MARK: - Requests
    func getPost(completion: @escaping ([Post]) -> Void) {

        // Create a decoder
        let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        // Create the request
        AF.request(devEndpoint+"/api/posts", method: .get)
            .validate()
            .responseDecodable(of: [Post].self, decoder: decoder) { response in
                // Handle the response
                switch response.result {
                case .success(let post):
                    print("Successfully get \(post.count) posts")
                    completion(post)
                case .failure(let error):
                    print("Error in NetworkManager.getPost: \(error.localizedDescription)")
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                         print("Response data: \(utf8Text)")
                     }
                }
            }
    }
    
    func addPost(title: String, item: String, completion: @escaping (Post) -> Void) {
        // Specify the endpoint

        // Define the request body
        
        // Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed

        // Create the request
        AF.request(devEndpoint+"/api/posts/create/", method: .post, parameters: [ "id": 10, "time": Date(), "title": title, "item": item, "status": "lost", "text": "", "location": "", "user_id": 0], encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) { response in
                // Handle the response
                switch response.result {
                case .success(let post):
                    print("Successfully added post \(post)")
                    completion(post)
                case .failure(let error):
                    print("Error in NetworkManager.addPost: \(error.localizedDescription)")
                }
            }
    }
    
}
