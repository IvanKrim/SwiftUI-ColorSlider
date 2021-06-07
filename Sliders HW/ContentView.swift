//
//  ContentView.swift
//  Sliders HW
//
//  Created by Kalabishka Ivan on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...250)
    @State private var greenSliderValue = Double.random(in: 0...250)
    @State private var blueSliderValue = Double.random(in: 0...250)
    
    var body: some View {
        ZStack {
            Background(red: CGFloat(redSliderValue / 255), green: CGFloat(greenSliderValue / 255), blue: CGFloat(blueSliderValue / 255))
            
            VStack {
                ColorizedView(red: CGFloat(redSliderValue / 255), green: CGFloat(greenSliderValue / 255), blue: CGFloat(blueSliderValue / 255))
                
                SliderStack(value: $redSliderValue, accentColor: .red)
                SliderStack(value: $greenSliderValue, accentColor: .green)
                SliderStack(value: $blueSliderValue, accentColor: .blue)
                
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - SLider
struct SliderStack: View {
    @State private var alertPresented = false
    @Binding var value: Double
    
    var accentColor: Color
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .frame(width: 35)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
            
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: checkValue)
                .disableAutocorrection(true)
                
                .frame(width: 45)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .colorMultiply(Color(UIColor(white: 1, alpha: 0.6)))
                
                .alert(isPresented: $alertPresented) {
                    Alert(
                        title: Text("Wrong Format"),
                        message: Text("Please enter value from 0 to 255")
                    )
                }
        }
        .padding(.horizontal)
    }
    
    private func checkValue() {
        if value < 0 || value > 255 {
            alertPresented.toggle()
            value = 100
        }
    }
}

// MARK: - View
struct ColorizedView: View {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 120)
            .foregroundColor(Color(UIColor(red: red, green: green, blue: blue, alpha: 1.0)))
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 3))
            .padding()
    }
}





