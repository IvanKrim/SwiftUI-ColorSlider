//
//  Background.swift
//  Sliders HW
//
//  Created by Kalabishka Ivan on 07.06.2021.
//

import SwiftUI

struct Background: View {
    
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    
    var body: some View {
        let firstColor = Color(UIColor(red: red, green: green, blue: blue, alpha: 1))
        let gradient = Gradient(colors: [firstColor, .black])
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
        
        Rectangle()
            .fill(linearGradient)
            .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(red: 21/255, green: 200/255, blue: 40/255)
    }
}
