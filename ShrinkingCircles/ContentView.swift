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
        
    //Return the path
        return path
        
    }
    
}


struct ContentView: View {
    var body: some View {
        ShrinkingCircles()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
