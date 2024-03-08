//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 29/02/24.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimation: Bool = false
    
    //MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func randomeSpeed() -> CGFloat {
        return CGFloat(Double.random(in: 0.05...1.0))
    }
    // 5. RANDOM DELAY
    func randomeDelay() -> CGFloat {
        return CGFloat(Double.random(in: 1.0...2.0))
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .scaleEffect(isAnimation ? randomScale() : 1)
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    ).onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomeSpeed())
                            .delay(randomeDelay())
                        ){
                            isAnimation = true
                        }
                    })
            }
        }//Zstack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
    
    
}
