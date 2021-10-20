//
//  SearchBar.swift
//  HomeWork-Search
//
//  参考Github上的写了一个自定义searchBar
//
//  Created by Michel on 2021/10/18.
//

import SwiftUI

extension View {
    fileprivate func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBar: View {
    var placeholder:String
    
    @State var searchText: String
    var onChange: ((String) -> Void)?
    var onCommit: ((String) -> Void)?
    
    init(placeholder: String = "Search", searchText: String = "", onChange: ((String) -> Void)? = nil, onCommit: ((String) -> Void)? = nil) {
        self.placeholder = placeholder
        
        _searchText = State(initialValue: searchText)
        
        self.onChange = onChange
        self.onCommit = onCommit
    }
    
    var body: some View {
        let binding = Binding<String> { () -> String in
            self.searchText
        } set: { (String) in
            self.searchText = String
            if self.onChange != nil {
                self.onChange!(self.searchText)
            }
        }
        
        return HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
                .foregroundColor(.secondary)
            TextField(searchText == "" ? placeholder : "", text: binding) { (isEditing) in
                if isEditing {
                        
                }
            } onCommit: {
                if self.onCommit != nil {
                    self.onCommit!(self.searchText)
                }
                UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
            }
            .keyboardType(.default)
            .padding(.leading, 0)
            .onTapGesture {}
            .onLongPressGesture {
                self.endEditing()
            }
            Button(action: {
                self.searchText = ""
                if self.onCommit != nil {
                    self.onCommit!(self.searchText)
                }
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.secondary)
                    .padding(.trailing, 10)
                    .opacity(searchText == "" ? Double(0) : Double(0.8))
            })
        }.padding(.leading, 0)
    }
}
