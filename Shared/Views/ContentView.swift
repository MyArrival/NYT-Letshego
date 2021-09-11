//
//  ContentView.swift
//  Shared
//
//  Created by Tefo Stanley on 10/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkAPI()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    
                    HStack{
                    VStack(alignment: .leading) {
                        Text(String(post.section)).bold()
                        Text(post.title).foregroundColor(.gray)
                        Text(post.published_date).foregroundColor(.blue)
                    }
                        
                    }
                    
                }
            }
            .navigationBarTitle("NYT POPULAR")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
