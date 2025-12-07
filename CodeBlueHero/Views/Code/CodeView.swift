//
//  CodeView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/6/25.
//

import SwiftUI
import Combine

struct CodeView: View {
    
    @State private var currentDate = Date.now
    @State private var timeElapsed = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(timeElapsed)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer) { date in
                timeElapsed = Int(date.timeIntervalSince(currentDate))
            }
        }
    }
}

#Preview {
    CodeView()
}
