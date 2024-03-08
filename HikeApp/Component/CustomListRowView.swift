//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 29/02/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    //MARK: - PROPERTIES
    
    @State  var rowLabel : String
    @State  var rowIcon : String
    @State  var rowContent : String? = nil
    @State  var rowTinColor : Color
    @State  var rowLinkLabel : String? = nil
    @State  var rowLinkDescription : String? = nil
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label:{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTinColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List() {
        CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Jhon doe", rowTinColor: .pink)
    }
}
