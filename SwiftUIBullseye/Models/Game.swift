//
//  Game.swift
//  SwiftUIBullseye
//
//  Created by Kostya Ozhiganov on 18.05.2022.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int{
        100 - abs(self.target - sliderValue)

        // abs - return absolute value
//        if difference < 0 {
//            difference = difference * -1
//
    }
}
