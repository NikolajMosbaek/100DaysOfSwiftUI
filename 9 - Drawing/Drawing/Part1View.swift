//
//  ContentView.swift
//  Drawing
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 27/01/2022.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let roationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - roationAdjustment
        let modifiedEndAngle = endAngle - roationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Part1View: View {
    var body: some View {
        NavigationView {
            //        drawTriangleWithPaths()
            //        drawTriangleWithShape()
            drawArcWithShape()
            
                .navigationTitle("Drawing - Part 1")
                .toolbar {
                    NavigationLink("Part 2") {
                        Part2View()
                    }
                }
        }
    }
    
    func drawTriangleWithPaths() -> some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
//        .fill(.blue)
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
    
    func drawTriangleWithShape() -> some View {
        Triangle()
//            .fill(.red)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
    }
    
    func drawArcWithShape() -> some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
