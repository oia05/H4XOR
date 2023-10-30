//
//  NetworkManager.swift
//  H4XOR
//
//  Created by OmarAssidi on 29/10/2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts: [Post] = []
    let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    func fetchNews() {
        guard let url = URL(string: url) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {data, response, error in
            if error == nil {
                if let data = data {
                    let result = self.decodeNews(data: data)
                    if let result = result {
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                    }
                }
            } else {
                print("Error: \(error)")
            }
        }
        task.resume()
        
    }
    
    private func decodeNews(data: Data) -> PostData? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(PostData.self, from: data)
            return result
        } catch {
            print("Error: \(error)")
            return nil
        }
        
    }
}
