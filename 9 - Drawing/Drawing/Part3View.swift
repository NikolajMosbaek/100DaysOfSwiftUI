//
//  Part3View.swift
//  Drawing
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 07/02/2022.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX =  columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct Part3View: View {
    @State private var amount = 0.0
    @State private var insetAmount = 50.0
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        
        NavigationView {
            drawCheckerboard()
    //        drawTrapezoid()
    //        drawColorlessBlurryImage()
    //        drawColorfulCircles()
    //        colorMultiplyer()
        }
        .navigationTitle("Drawing - Part 3")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink("Part 4") {
                Part4View()
            }
        }
    }
        
    private func drawCheckerboard() -> some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
    
    private func drawTrapezoid() -> some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
    
    private func drawColorlessBlurryImage() -> some View {
        VStack {
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
    
    private func drawColorfulCircles() -> some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
    
    private func colorMultiplyer() -> some View {
        ZStack {
            Image("PaulHudson")
                .colorMultiply(.red)
            
//            Rectangle()
//                .fill(.)
//                .blendMode(.multiply)
        }
    }
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
