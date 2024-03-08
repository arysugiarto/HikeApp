//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 28/02/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimationGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .pink,
                            Color.customIndigoMedium,
                                 Color.customSalmonLight],
                        startPoint: isAnimationGradient ? .topLeading : .bottomLeading ,
                        endPoint: isAnimationGradient ? .bottomTrailing: .topTrailing
                    )
                    
            )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimationGradient.toggle()
                        
                    }
                   
            }
            MotionAnimationView()
        } //ZSTACK
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
