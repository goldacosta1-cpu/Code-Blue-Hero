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
    }
}

#Preview {
    HomeView()
}
