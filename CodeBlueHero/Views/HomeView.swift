//
//  HomeView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/6/25.
//

import SwiftUI

struct HomeView: View {
    
    enum Pages: String {
        case code
    }
    
    @State private var selectedTab: Pages = .code
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: .code) {
                CodeView()
            } label: {
                Label {
                    Text(Pages.code.rawValue.capitalized)
                } icon: {
                    Image(.heartBeat)
                }
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            VStack {
                Text("NEXT ACTION")
                    .font(.system(size: 12))
                    .foregroundStyle(.textGray)
                Text("Start CPR")
                    .font(.system(size: 14))
                    .foregroundStyle(.textBlue700)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundBlue50)
            .overlay {
                Capsule().stroke(Color(.borderBlue400), lineWidth: 2)
            }
        }
    }
}

#Preview {
    HomeView()
}
