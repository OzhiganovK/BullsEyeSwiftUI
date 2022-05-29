//
//  Shapes.swift
//  SwiftUIBullseye
//
//  Created by Kostya Ozhiganov on 25.05.2022.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes{
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200.0, height: 100.0)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
                .animation(.easeInOut)
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
