//
//  CodeView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/6/25.
//

import SwiftUI
import SwiftData
import Combine

struct CodeView: View {
    
    @Query private var codeLog: [CodeLog]
    @State private var currentDate = Date.now
    @State private var timeElapsed = 0
    @State private var isRecentEventsExpanded = true
    @State private var isCprStarted = false
    @State private var codeObservable = CodeObservable()
    @State private var remainingSeconds = 120
    @State private var isVFSelected = false
    @State private var currentRhythmSelected = ""
    @State private var shockCount = 0
    private let remainingTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var formattedTimerString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(timeElapsed)) ?? "00:00"
    }
    private var formattedRemainingTimerString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(remainingSeconds)) ?? "00:00"
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Star of Code Time / CPR
                    if !isCprStarted {
                        // Default layout when CPR timer is not started
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
                                withAnimation {
                                    isCprStarted = true
                                }
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
                        }
                    } else {
                        // CPR Started
                        HStack {
                            VStack {
                                Text("CODE TIME")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.textGray400)
                                Text(formattedTimerString)
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.textGray600)
                                    .monospacedDigit()
                                    .bold()
                            }
                            // Share Timer
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundStyle(.white)
                                    Text("Share Timer")
                                        .foregroundStyle(.white)
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(.backgroundBlue)
                                .clipShape(Capsule())
                            }
                        }
                        // CPR Cycle Timer
                        VStack {
                            HStack {
                                Image(systemName: "timer.circle.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.backgroundBlue)
                                Text("CPR CYCLE TIMER")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.backgroundBlue)
                                    .bold()
                            }
                            Text(formattedRemainingTimerString)
                                .font(.system(size: 80))
                                .foregroundStyle(remainingSeconds == 0 ? .textRed600 : remainingSeconds <= 30 ? .textAmber600 : .textGray900)
                                .bold()
                            HStack {
                                Circle()
                                    .fill(.backgroundGreen500)
                                    .frame(width: 8, height: 8)
                                    .padding(.trailing, 8)
                                Text("Continue CPR • High quality compressions")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.textGray600)
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding(.vertical, 16)
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
                    // Shock
                    if isVFSelected {
                        VStack(spacing: 8) {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.backgroundOrange500)
                            Text("Shock")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundStyle(.textOrange600)
                            HStack(spacing: 8) {
                                Text("\(shockCount) given •")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.textGray500)
                                Text("Next: #\(shockCount + 1)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundStyle(.textGray700)
                            }
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity)
                        .background(.backgroundOrange50)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay {
                            RoundedRectangle(cornerRadius: 24).stroke(Color(.borderOrange400), lineWidth: 2)
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
                            // Current rhythm label
                            Spacer()
                            if !currentRhythmSelected.isEmpty {
                                Text("Current: \(currentRhythmSelected)")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundStyle(.textGray700)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.backgroundGray200)
                                    .clipShape(Capsule())
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("SHOCKABLE RHYTHMS")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundStyle(.textOrange600)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Button {
                                isVFSelected = true
                                currentRhythmSelected = "VF"
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
                    // Continuous Reminders
                    VStack {
                        // This value is dynamic
                        Text("Minimize compression interruptions • IV/IO access should be verified • Consider advanced airway")
                            .foregroundStyle(.textGray600)
                            .font(.system(size: 12))
                            .padding(16)
                    }
                    .background(.backgroundGray100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16).stroke(Color(.borderGray200), lineWidth: 2)
                    }
                    // Action Buttons
                    VStack {
                        HStack {
                            Button {
                            } label: {
                                VStack {
                                    Image(.ActionButtons.amio)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    Text("Amio")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderPurple400), lineWidth: 2)
                                }
                            }
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(.ActionButtons.ivFluids)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(.fluid)
                                    Text("IV Fluids")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderBlue400), lineWidth: 2)
                                }
                            }
                        }
                        // medications, pulse
                        HStack {
                            Button {
                            } label: {
                                VStack {
                                    Image(.ActionButtons.medications)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    Text("Medications")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderOrange400), lineWidth: 2)
                                }
                            }
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(.ActionButtons.pulse)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(.fluid)
                                    Text("Pulse")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderBlue400), lineWidth: 2)
                                }
                            }
                        }
                        // Airway, ROSC
                        HStack {
                            Button {
                            } label: {
                                VStack {
                                    Image(.ActionButtons.airway)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    Text("Airway")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderTeal400), lineWidth: 2)
                                }
                            }
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(.ActionButtons.ROSC)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(.fluid)
                                    Text("ROSC")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.textGray900)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                                .padding(16)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24).stroke(Color(.borderGreen400), lineWidth: 2)
                                }
                            }
                        }
                    } // end of action buttons
                    // recent events
                    List {
                        Section(isExpanded: $isRecentEventsExpanded) {
                            ForEach(codeLog) { codeLog in
                                RecentEventsRowView(codeLog: codeLog)
                            }
                        } header: {
                            HStack {
                                Text("Recent Events")
                                    .foregroundStyle(.textGray900)
                                    .bold()
                                Spacer()
                                Button {
                                    withAnimation {
                                        isRecentEventsExpanded.toggle()
                                    }
                                } label: {
                                    Image(systemName: "chevron.right")
                                        .rotationEffect(!isRecentEventsExpanded ? Angle(degrees: 0) : Angle(degrees: 90))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 16)
                .onReceive(timer) { date in
                    timeElapsed = Int(date.timeIntervalSince(currentDate))
                }
                .onReceive(remainingTimer) { date in
                    if isCprStarted {
                        if remainingSeconds > 0 {
                            remainingSeconds -= 1
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Button {
                                
                            } label: {
                                Text("Save")
                            }
                            Button {
                                
                            } label: {
                                Text("Undo")
                            }
                            Button {
                                
                            } label: {
                                Text("Log")
                            }
                            Button {
                                
                            } label: {
                                Text("End")
                            }
                            Button {
                                
                            } label: {
                                Text("New")
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                        }
                    }
                }
                .onAppear {
                    // Save log code timer here
                }
            }
            .background(.backgroundGray50)
        }
    }
}

#Preview {
    CodeView()
}
