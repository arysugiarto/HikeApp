//
//  CardView.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 27/02/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomeNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - FUNCTIONS
    func randomImage(){
        
        repeat{
            randomeNumber = Int.random(in: 1...5)
        
        } while randomeNumber == imageNumber
        
        imageNumber = randomeNumber
    }
    
    var body: some View {
        ZStack{
            CustomBackgroundView()
            VStack {
            // MARK: - HEADER
            
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom
                        ))
                        
                        Spacer()
                        
                        Button{
                            // ACTION: Show a sheet
                            print("Button di tekan")
                            isShowingSheet.toggle()
                        } label: {
                           CusstomButtonView()
                        }.sheet(isPresented: $isShowingSheet, content: {
                            SettingsViews()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    Text("Bersenang-senanglah aktivitas di luar rumah dengan teman dan keluarga")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
            //MARK: - CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 5), value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button{
                    // ACTION: Generate a random number
                    print("Button 2 di tekan")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom
                            )
                        )
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
//                .buttonStyle(.borderedProminent)
//                .tint(.indigo)
                .buttonStyle(GradienButton())
            } //: VSTACK
            
            }//: CARD
            .frame(width:320, height:570)
        }
       
    }


#Preview {
    CardView()
}
