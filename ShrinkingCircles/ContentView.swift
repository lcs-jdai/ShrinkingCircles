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

struct CircleTwo : Shape
{
    func drawCircles(path: inout Path, center:CGPoint, radius: Double, level:Int){
        if(level == 0)
        {
            return
        }
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: center.x - radius, y: center.y - radius ), size: CGSize(width: radius * 2, height: radius * 2)))
        
        
        var points: [CGPoint] =  [
            CGPoint(x: center.x - radius, y: center.y),
            CGPoint(x: center.x + radius, y: center.y),
            CGPoint(x: center.x , y: center.y + radius),
            CGPoint(x: center.x , y: center.y - radius),
        ]
        
        for _point in points
        {
            drawCircles(path: &path, center: _point, radius: radius / 3, level: level - 1)
        }

    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        drawCircles(path: &path, center: CGPoint(x: rect.maxX / 2, y: rect.maxY / 2 ), radius: 200, level: 4)
        return path
    }
    
    
}

struct ContentView: View {
    var body: some View {
        CircleTwo()
            .stroke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
