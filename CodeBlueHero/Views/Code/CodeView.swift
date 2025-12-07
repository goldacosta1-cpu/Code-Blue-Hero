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
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var formattedTimerString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(timeElapsed)) ?? "00:00"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(formattedTimerString)
                    .font(.system(size: 40))
                    .monospacedDigit()
                    .bold()
                    .padding(.top, 16)
                // Share Timer
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.white)
                        Text("Share Timer")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(.backgroundBlue)
                    .clipShape(Capsule())
                }
                Spacer()
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
