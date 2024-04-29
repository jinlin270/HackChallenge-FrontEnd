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
    
    func addPost(message: String, completion: @escaping (Post) -> Void) {
        // Specify the endpoint

        // Define the request body
        
        // Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed

        // Create the request
        AF.request(devEndpoint+"/api/posts/create/", method: .post, parameters: ["message": message], encoding: JSONEncoding.default)
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
    
    func likePost(post_id: String, completion: @escaping (Bool) -> Void) {
        // Specify the endpoint

        // Define the request body
      let parameters = [
        "post_id": post_id,
        "net_id": "lj233"]
        
        // Create a decoder
        let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .iso8601 // Only if needed
         decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        print(parameters)

        // Create the request
        AF.request(devEndpoint+"/api/posts/like/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) { response in
                // Handle the response
                switch response.result {
                case .success(let post):
                    print("Successfully liked post \(post)")
                    completion(true)
                case .failure(let error):
                    if let statusCode = response.response?.statusCode, statusCode == 400 {
                       print("You have already liked this post")
                    } else {
                        print("Error in NetworkManager.addPost: \(error.localizedDescription)")}
                }
            }
    }
    
    
    func unlikePost(post_id: String, completion: @escaping (Bool) -> Void) {
        // Specify the endpoint

        // Define the request body
      let parameters = [
        "post_id": post_id,
        "net_id": "lj233"]
        
        // Create a decoder
        let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .iso8601 // Only if needed
         decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        print(parameters)

        // Create the request
        AF.request(devEndpoint+"/api/posts/unlike/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) { response in
                // Handle the response
                switch response.result {
                case .success(let post):
                    print("Successfully unliked post \(post)")
                    completion(true)
                case .failure(let error):
                    if let statusCode = response.response?.statusCode, statusCode == 400 {
                       print("You did not like this post")
                    } else {
                        print("Error in NetworkManager.addPost: \(error.localizedDescription)")}
                }
            }
    }




}
