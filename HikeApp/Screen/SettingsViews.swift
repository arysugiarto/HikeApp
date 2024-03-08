//
//  SettingsViews.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 29/02/24.
//

import SwiftUI

struct SettingsViews: View {
    // MARK - PRPERTIES
    private let alternateAppsIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Camera",
        "AppIcon-Mushroom",
        "AppIcon-Map",
        "AppIcon-Campfire",
        "AppIcon-Backpack"
    ]
    
    
    var body: some View {
        List{
            // MARK: - SECTION HEADER
            
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 88, weight: .black))
                    VStack {
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editor Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 88, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                                .customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ).padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                        .font(.footnote)
                        .italic()
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            }.listRowSeparator(.hidden)
            // MARK: - SECTION  ICONS
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal, showsIndicators:false){
                    HStack(spacing:12) {
                        ForEach(alternateAppsIcons.indices, id: \.self) { item in
                            Button{
                                print("Icon was pressed")
                                
                                UIApplication.shared
                                    .setAlternateIconName(alternateAppsIcons[item]){
                                        error in if error != nil {
                                            print("Request gagal icon: \(String(describing: error?.localizedDescription))")
                                        } else {
                                            print("Success ! kamu mengubah icon nya \(alternateAppsIcons[item])")
                                        }
                                    }
                            } label: {
                                Image("\(alternateAppsIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height:80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(8)
                
                
                Text("Choose your favorite app icon from the collectionn above")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(12)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ABOUT
            
            Section(
                header: Text("About App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright All right reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                //basic label content
//                LabeledContent("Application", value:"Hike")
                
                //advance label content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTinColor: .blue)
                
                CustomListRowView(rowLabel: "Message", rowIcon: "paperplane.circle.fill", rowContent: "Pesan", rowTinColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTinColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTinColor: .gray)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ary", rowTinColor: .purple)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Jhon", rowTinColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "https://creedo.academy", rowTinColor: .green)
                
            }//:SECTION
        }//: LIST
    }
}

#Preview {
    SettingsViews()
}
