//
//  NetworkManager.swift
//  HackerNewsPocket
//
//  Created by Avichai Eliyahu on 09/04/2023.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    let apiURL = "http://hn.algolia.com/api/v1/search?tags=front_page"
    func fetchData(){
        if let url = URL(string: apiURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?){
        if error == nil{
            let decoder = JSONDecoder()
            if let safeData = data{
                do{
                    let results = try decoder.decode(Result.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
