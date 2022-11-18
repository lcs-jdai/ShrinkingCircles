//
//  ContentView.swift
//  ShrinkingCircles
//
//  Created by Dai Jiaze on 2022-11-18.
//

import SwiftUI

struct ShrinkingCircles: Shape {
    
    func path(in rect: CGRect) -> Path {
    
    //Create a Path
        var path = Path()
        for _radius in 0...20{
            let actual_radius = Double(_radius) * 10.0
            
            path.addEllipse(in: CGRect(origin: CGPoint(x: rect.width / 2 - actual_radius, y: rect.height / 2 - actual_radius), size: CGSize(width: actual_radius * 2 , height: actual_radius * 2)))
        }
        
    //Return the path
        return path
        
    }
    
}


struct ContentView: View {
    var body: some View {
        ShrinkingCircles()
            .stroke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
