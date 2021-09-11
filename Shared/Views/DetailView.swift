//
//  DetailView.swift
//  NYT Letshego (iOS)
//
//  Created by Tefo Stanley on 10/09/21.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.letshego.com")
    }
}
