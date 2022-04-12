//
//  Part1View.swift
//  Bookworm
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 17/02/2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(radius: isOn ? 0 : 5)
    }
}

struct Part1View: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remeber me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct Part1View_Previews: PreviewProvider {
    static var previews: some View {
        Part1View()
    }
}
