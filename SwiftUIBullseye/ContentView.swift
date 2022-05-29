//
//  ContentView.swift
//  SwiftUIBullseye
//
//  Created by Kostya Ozhiganov on 17.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }else {
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
            }
        }
            if !alertIsVisible{
            SliderView(sliderValue: $sliderValue)
        }
    }
}

    struct InstructionsView: View {
        @Binding var game: Game
        var body: some View{
            VStack{
                InstructionText(text: "🎯PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                BigNumberText(text: String(game.target))
            }
        }
    }
    struct SliderView: View{
        @Binding var sliderValue: Double
        var body: some View{
            HStack {
                SliderLabelText(text: "1")
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                SliderLabelText(text: "100")
            }
        }
    }
    
    struct HitMeButton: View {
        
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View{
            VStack {
                Button (action: {
                    withAnimation{
                    alertIsVisible = true
                    }
                }) {
                        Text ("HIT ME")
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                
                .background(ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
                
                .foregroundColor(Color.white)
                .cornerRadius(23.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 23.0)
                          .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
        }
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
}
}
