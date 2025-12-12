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
    @State private var codeObservable = CodeObservable()
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
            ScrollView {
                VStack(spacing: 16) {
                    Text("CODE TIME")
                        .font(.system(size: 12))
                        .foregroundStyle(.textGray)
                        .fontWeight(.semibold)
                        .padding(.top, 32)
                    Text(formattedTimerString)
                        .font(.system(size: 40))
                        .monospacedDigit()
                        .bold()
                    // Share Timer
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.white)
                            Text("Share Timer")
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(.backgroundBlue)
                        .clipShape(Capsule())
                    }
                    // Start CPR Cycle
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: "timer.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.white)
                            Text("START CPR CYCLE")
                                .font(.system(size: 24))
                                .foregroundStyle(.white)
                            Text("Tap to begin 2-minute timer")
                                .font(.system(size: 14))
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
                    // First Epi Dose & Time Since Shock
                    HStack {
                        VStack(spacing: 8) {
                            Image(systemName: "pill")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("FIRST EPI DOSE")
                                .foregroundStyle(.textGray)
                                .font(.system(size: 12))
                            Text("Not Due Yet")
                                .font(.system(size: 18))
                                .foregroundStyle(.textGray)
                        }
                        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                        .padding(16)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay {
                            RoundedRectangle(cornerRadius: 24).stroke(Color(.borderGray300), lineWidth: 2)
                        }
                        VStack {
                            VStack(spacing: 8) {
                                Image(systemName: "bolt.fill")
                                Text("TIME SINCE SHOCK")
                                    .foregroundStyle(.textGray)
                                    .foregroundStyle(.textGray)
                                    .font(.system(size: 12))
                            }
                            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                            .padding(16)
                        }
                        .background(.backgroundGray100)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay {
                            RoundedRectangle(cornerRadius: 24).stroke(Color(.borderGray300), lineWidth: 2)
                        }
                    }
                    // Rhythm Check
                    VStack(spacing: 10) {
                        HStack {
                            Image(.pulse)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.textGray)
                            Text("RHYTHM CHECK")
                                .font(.system(size: 14))
                                .foregroundStyle(.textGray600)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("SHOCKABLE RHYTHMS")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundStyle(.textOrange600)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Button {
                                
                            } label: {
                                Text("VF")
                                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
                                    .background(.backgroundRed500)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .bold()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16).stroke(Color(.borderRed600), lineWidth: 2)
                                    }
                            }
                            Button {
                                
                            } label: {
                                Text("VTach")
                                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
                                    .background(.backgroundRed500)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .bold()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16).stroke(Color(.borderRed600), lineWidth: 2)
                                    }
                            }
                        }
                        Text("NON-SHOCKABLE RHYTHMS")
                            .foregroundStyle(.textBlue600)
                            .font(.system(size: 12))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Button {
                                
                            } label: {
                                Text("PEA")
                                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
                                    .background(.backgroundGray300)
                                    .foregroundStyle(.textGray900)
                                    .font(.system(size: 14))
                                    .bold()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16).stroke(Color(.borderGray400), lineWidth: 2)
                                    }
                            }
                            Button {
                                
                            } label: {
                                Text("Asystole")
                                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
                                    .background(.backgroundGray300)
                                    .foregroundStyle(.textGray900)
                                    .font(.system(size: 14))
                                    .bold()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16).stroke(Color(.borderGray400), lineWidth: 2)
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(.backgroundGray100)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay {
                        RoundedRectangle(cornerRadius: 24).stroke(Color(.borderGray300), lineWidth: 2)
                    }
                    // ACLS Protocol
                    VStack(spacing: 12) {
                        Text("📋 ACLS PROTOCOL")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundStyle(.textBlue700)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(codeObservable.cprStatus.rawValue)
                            .foregroundStyle(.textBlue800)
                            .font(.system(size: 12))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(.backgroundBlue50)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay {
                        RoundedRectangle(cornerRadius: 24).stroke(Color(.borderBlue300), lineWidth: 2)
                    }
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
}

#Preview {
    CodeView()
}
