//
//  PostData.swift
//  NYT Letshego (iOS)
//
//  Created by Tefo Stanley on 10/09/21.
//
import Foundation

struct Results: Decodable {
    let results: [Post] //
}

struct Post: Decodable, Identifiable {
    var id: String {
        return uri
    }
    let uri: String //
    let section: String //
    let title: String //
    let published_date: String//
    let url: String? //
    
    
}
