//
//  NetworkManager.swift
//  NYT Letshego (iOS)
//
//  Created by Tefo Stanley on 10/09/21.
//

import Foundation

class NetworkAPI: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=zqW1hWKm8FjtdgJcq7H6pDjMo5dDftR9") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let nytresults = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = nytresults.results //results instead of hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
