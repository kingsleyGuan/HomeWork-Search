//
//  ContentView.swift
//  HomeWork-Search
//
//  Created by Michel on 2021/9/30.
//

import SwiftUI

struct ContentView: View {
    /// 用于List显示数据源
    @State var array = [ListModel(title: "V11", subTitle: "In-stock", price: "599.00", isSelect: true),
                 ListModel(title: "V10", subTitle: "Out-of-stock", price: "399.99", isSelect: false),
                 ListModel(title: "V12", subTitle: "In-stock", price: "599.00", isSelect: true),
                 ListModel(title: "V13", subTitle: "In-stock", price: "599.00", isSelect: false),
                 ListModel(title: "V14", subTitle: "In-stock", price: "599.00", isSelect: true),
                 ListModel(title: "V15", subTitle: "In-stock", price: "599.00", isSelect: false),
                 ListModel(title: "V16", subTitle: "In-stock", price: "599.00", isSelect: true),
                 ListModel(title: "V17", subTitle: "In-stock", price: "599.00", isSelect: false)]
    
    /// 原始数据源
    var originArray: [ListModel] = [ListModel(title: "V11", subTitle: "In-stock", price: "599.00", isSelect: true),
                                    ListModel(title: "V10", subTitle: "Out-of-stock", price: "399.99", isSelect: false),
                                    ListModel(title: "V12", subTitle: "In-stock", price: "599.00", isSelect: true),
                                    ListModel(title: "V13", subTitle: "In-stock", price: "599.00", isSelect: false),
                                    ListModel(title: "V14", subTitle: "In-stock", price: "599.00", isSelect: true),
                                    ListModel(title: "V15", subTitle: "In-stock", price: "599.00", isSelect: false),
                                    ListModel(title: "V16", subTitle: "In-stock", price: "599.00", isSelect: true),
                                    ListModel(title: "V17", subTitle: "In-stock", price: "599.00", isSelect: false)]
    
    @State var searchText: String = ""
    var body: some View {

        NavigationView {
            VStack {
                SearchBar(placeholder: "Tap here to search", searchText: searchText) { (text) in
                    print("onChange:\(text)")
                    self.searchText = text
                    self.updateList(key: text)
                } onCommit: { (text) in
                    print("onCommit:\(text)")
                    self.searchText = text
                }
                .frame(height: 34)
                .background(RoundedRectangle(cornerRadius: 17).foregroundColor(Color.gray))
                List(array, id: \.self) { item in
                    CustomRow(listModel: item)

                }
                
            }
            .navigationBarTitle("List", displayMode: .inline)
        }
    }
    
    //根据搜索内容筛选List数据源
    func updateList(key: String) {
        array.removeAll()
        array.append(contentsOf: originArray)
        var tmpArray = [ListModel]()
        for item in array {
            if item.title?.lowercased().contains(key.lowercased()) == true {
                tmpArray.append(item)
            }
        }
        array.removeAll()
        array.append(contentsOf: tmpArray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
