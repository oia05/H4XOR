//
//  WebView.swift
//  H4XOR
//
//  Created by OmarAssidi on 29/10/2023.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = urlString {
            guard let urlObject = URL(string: url) else {return}
            let request = URLRequest(url: urlObject)
            uiView.load(request)
        }
    }
}
