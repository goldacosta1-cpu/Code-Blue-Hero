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
                // Start CPR Cycle
                Button {
                    
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "timer.circle.fill")
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                        Text("START CPR CYCLE")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                        Text("Tap to begin 2-minute timer")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(24)
                    .background(.backgroundGreen500)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay {
                        RoundedRectangle(cornerRadius: 24).stroke(Color(.borderGreen600), lineWidth: 4)
                    }
                }
                // Next Action
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 16)
            .onReceive(timer) { date in
                timeElapsed = Int(date.timeIntervalSince(currentDate))
            }
        }
    }
}

#Preview {
    CodeView()
}
