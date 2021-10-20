//
//  CustomRow.swift
//  HomeWork-Search
//
//  Created by Michel on 2021/9/30.
//

import SwiftUI

struct CustomRow: View {
    var listModel: ListModel
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(listModel.title!)
                    .foregroundColor(Color(hex: 0x474747))
                    .font(.system(size: 15))

                Text(listModel.subTitle!)
                    .foregroundColor(.gray)
                    .font(.system(size: 11))
            }
            Spacer()
            let foregroundColor = listModel.isSelect ? Color(hex: 0x5B7DCE) : Color(hex: 0xB1B1B1)
            let backgroundColor = listModel.isSelect ? Color(hex: 0xF5F8FE) : Color(hex: 0xF6F6F6)
            
            
            Text("$\(listModel.price!)")
                .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                .font(.system(size: 11))
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(10.0)
                .padding(.trailing, 10)
        }
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

//struct CustomRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomRow(listModel: <#T##ListModel#>)
//    }
//}
