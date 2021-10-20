//
//  SearchDetail.swift
//  HomeWork-Search
//
//  Created by Michel on 2021/10/8.
//

import SwiftUI

struct SearchDetail: View {
    var title: String
    var body: some View {
            Text("Hello, World!")
                .navigationBarTitle(title, displayMode: .inline)
    }
}

struct SearchDetail_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetail(title: "Title")
    }
}
