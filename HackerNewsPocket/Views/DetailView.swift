//
//  DetailView.swift
//  HackerNewsPocket
//
//  Created by Avichai Eliyahu on 09/04/2023.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url:String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
