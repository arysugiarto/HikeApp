//
//  GradienButtonStyle.swift
//  HikeApp
//
//  Created by Ary Sugiarto on 28/02/24.
//

import Foundation
import SwiftUI

struct GradienButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal)
            .background(
                // Contitional statement with nil coalescing
                // condition ? A: B
                configuration.isPressed ?
                // A: Shen user pressed the button
                LinearGradient(
                    colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom
                )
                
                :
                    
                // B: When the button is not pressed
                LinearGradient(
                    colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                ).cornerRadius(40)
    }
}
